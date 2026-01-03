package org.spacequest;

import com.javarush.quest.HelloServlet;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.mockito.Mockito.*;

class HelloServletTest {

    private HelloServlet servlet;
    private HttpServletRequest req;
    private HttpServletResponse resp;

    @BeforeEach
    void setUp() {
        servlet = new HelloServlet();
        req = mock(HttpServletRequest.class);
        resp = mock(HttpServletResponse.class);
    }

    @Test
    void shouldForwardToIndexJsp_onGet() throws Exception {
        when(req.getMethod()).thenReturn("GET");

        RequestDispatcher rd = mock(RequestDispatcher.class);
        when(req.getRequestDispatcher("/index.jsp")).thenReturn(rd);

        // вызываем public service(ServletRequest, ServletResponse)
        servlet.service((ServletRequest) req, (ServletResponse) resp);

        verify(req).getRequestDispatcher("/index.jsp");
        verify(rd).forward(req, resp);

        // на всякий случай: никаких редиректов
        verify(resp, never()).sendRedirect(anyString());
    }
}
