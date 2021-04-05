package ua.javavision.servlets;


import ua.javavision.dao.UserDAO;
import ua.javavision.model.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.concurrent.atomic.AtomicReference;

/**
 * ContextListener помещает пользователя dao в контекст сервлета.
 */
@WebListener
public class ContextListener implements ServletContextListener {
    /**
     *
     * Поддельный соединитель базы данных.
     */
    private AtomicReference<UserDAO> dao;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        dao = new AtomicReference<>(new UserDAO());

        dao.get().add(new User(1, "teacher", "admin", User.ROLE.ADMIN));



        final ServletContext servletContext =
                servletContextEvent.getServletContext();

        servletContext.setAttribute("dao", dao);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        dao = null;
    }
}