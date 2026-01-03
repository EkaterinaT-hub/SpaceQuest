package org.spacequest;

import com.javarush.quest.GameServlet;
import com.javarush.quest.model.QuestStep;
import com.javarush.quest.service.QuestService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class GameServletTest {

    private QuestService questService;
    private GameServlet servlet;

    private HttpServletRequest req;
    private HttpServletResponse resp;
    private HttpSession session;

    @BeforeEach
    void setUp() {
        questService = mock(QuestService.class);
        servlet = new GameServlet(questService);

        req = mock(HttpServletRequest.class);
        resp = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    private void callServlet() throws Exception {
        servlet.service((ServletRequest) req, (ServletResponse) resp);
    }

    // ---- doGet ----

    @Test
    void doGet_shouldDefaultToStart_andForwardToGameJsp() throws Exception {
        when(req.getMethod()).thenReturn("GET");
        when(req.getParameter("step")).thenReturn(null);

        QuestStep step = mock(QuestStep.class);
        when(questService.getStep("start")).thenReturn(step);

        RequestDispatcher rd = mock(RequestDispatcher.class);
        when(req.getRequestDispatcher("/game.jsp")).thenReturn(rd);

        callServlet();

        verify(req).setAttribute("step", step);
        verify(rd).forward(req, resp);
        verify(resp, never()).sendError(anyInt(), anyString());
    }

    @Test
    void doGet_shouldSend404_whenStepNotFound() throws Exception {
        when(req.getMethod()).thenReturn("GET");
        when(req.getParameter("step")).thenReturn("bad");
        when(questService.getStep("bad")).thenReturn(null);

        callServlet();

        verify(resp).sendError(HttpServletResponse.SC_NOT_FOUND, "Step not found!");
        verify(req, never()).getRequestDispatcher(anyString());
    }

    // ---- doPost ----

    @Test
    void doPost_shouldRedirectToStart_whenAnswerOrCurrentStepMissing() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);

        when(req.getParameter("answer")).thenReturn(null);
        when(req.getParameter("currentStep")).thenReturn("start");

        callServlet();

        verify(resp).sendRedirect("/HelloQuest/game?step=start");
    }

    @Test
    void doPost_shouldRedirectToStart_whenCurrentStepNotFound() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);

        when(req.getParameter("answer")).thenReturn("1");
        when(req.getParameter("currentStep")).thenReturn("start");
        when(questService.getStep("start")).thenReturn(null);

        callServlet();

        verify(resp).sendRedirect("/HelloQuest/game?step=start");
    }

    @Test
    void doPost_shouldGoToNextStep1_whenAnswerIs1() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);

        when(req.getParameter("answer")).thenReturn("1");
        when(req.getParameter("currentStep")).thenReturn("start");

        QuestStep current = mock(QuestStep.class);
        when(current.getNextStepId1()).thenReturn("s1");
        when(questService.getStep("start")).thenReturn(current);

        when(questService.isFinalStep("s1")).thenReturn(false);

        callServlet();

        verify(resp).sendRedirect("/HelloQuest/game?step=s1");
        verify(session, never()).setAttribute(eq("gamesPlayed"), any());
    }

    @Test
    void doPost_shouldGoToNextStep2_whenAnswerIsNot1() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);

        when(req.getParameter("answer")).thenReturn("2");
        when(req.getParameter("currentStep")).thenReturn("start");

        QuestStep current = mock(QuestStep.class);
        when(current.getNextStepId2()).thenReturn("s2");
        when(questService.getStep("start")).thenReturn(current);

        when(questService.isFinalStep("s2")).thenReturn(false);

        callServlet();

        verify(resp).sendRedirect("/HelloQuest/game?step=s2");
    }

    @Test
    void doPost_shouldIncrementGamesPlayed_whenFinalStep() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);

        when(req.getParameter("answer")).thenReturn("1");
        when(req.getParameter("currentStep")).thenReturn("start");

        QuestStep current = mock(QuestStep.class);
        when(current.getNextStepId1()).thenReturn("final");
        when(questService.getStep("start")).thenReturn(current);

        when(questService.isFinalStep("final")).thenReturn(true);

        when(session.getAttribute("gamesPlayed")).thenReturn(0);

        callServlet();

        verify(session).setAttribute("gamesPlayed", 1);
        verify(resp).sendRedirect("/HelloQuest/game?step=final");
    }
}
