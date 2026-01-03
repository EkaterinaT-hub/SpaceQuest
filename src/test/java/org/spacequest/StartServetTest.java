package org.spacequest;

import com.javarush.quest.StartServet;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class StartServetTest {

    private StartServet servlet;

    private HttpServletRequest req;
    private HttpServletResponse resp;
    private HttpSession session;

    @BeforeEach
    void setUp() {
        servlet = new StartServet();
        req = mock(HttpServletRequest.class);
        resp = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    void doGet_shouldForwardToIndexJsp() throws Exception {
        when(req.getMethod()).thenReturn("GET");

        RequestDispatcher rd = mock(RequestDispatcher.class);
        when(req.getRequestDispatcher("/index.jsp")).thenReturn(rd);

        servlet.service((ServletRequest) req, (ServletResponse) resp);

        verify(rd).forward(req, resp);
        verify(resp, never()).sendRedirect(anyString());
    }

    @Test
    void doPost_shouldStorePlayerNameAndResetGamesPlayed_thenRedirectToStartStep() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);
        when(req.getParameter("playerName")).thenReturn("Kate");

        servlet.service((ServletRequest) req, (ServletResponse) resp);

        verify(session).setAttribute("playerName", "Kate");
        verify(session).setAttribute("gamesPlayed", 0);
        verify(resp).sendRedirect("/HelloQuest/game?step=start");
    }

    @Test
    void doPost_shouldUseDefaultName_whenBlank() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);
        when(req.getParameter("playerName")).thenReturn("   "); // пустое после trim

        servlet.service((ServletRequest) req, (ServletResponse) resp);

        verify(session).setAttribute("playerName", "Adventure seeker");
        verify(session).setAttribute("gamesPlayed", 0);
        verify(resp).sendRedirect("/HelloQuest/game?step=start");
    }

    @Test
    void doPost_shouldUseDefaultName_whenNull() throws Exception {
        when(req.getMethod()).thenReturn("POST");
        when(req.getContextPath()).thenReturn("/HelloQuest");
        when(req.getSession()).thenReturn(session);
        when(req.getParameter("playerName")).thenReturn(null);

        servlet.service((ServletRequest) req, (ServletResponse) resp);

        verify(session).setAttribute("playerName", "Adventure seeker");
        verify(session).setAttribute("gamesPlayed", 0);
        verify(resp).sendRedirect("/HelloQuest/game?step=start");
    }
}
