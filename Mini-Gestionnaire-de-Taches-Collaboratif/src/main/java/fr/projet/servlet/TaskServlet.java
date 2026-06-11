package fr.projet.servlet;

import fr.projet.model.Task;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String TASKS_SESSION_KEY = "tasks";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addTask(request);
        } else if ("delete".equals(action)) {
            deleteTask(request);
        } else if ("toggle".equals(action)) {
            toggleTask(request);
        }

        response.sendRedirect(request.getContextPath() + "/tasks.jsp");
    }

    @SuppressWarnings("unchecked")
    private List<Task> getTasks(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Task> tasks = (List<Task>) session.getAttribute(TASKS_SESSION_KEY);

        if (tasks == null) {
            tasks = new ArrayList<>();
            session.setAttribute(TASKS_SESSION_KEY, tasks);
        }

        return tasks;
    }

    private void addTask(HttpServletRequest request) {
        String title = clean(request.getParameter("title"));
        String description = clean(request.getParameter("description"));
        LocalDate dueDate = parseDate(request.getParameter("dueDate"));

        if (!title.isEmpty() && !description.isEmpty() && dueDate != null) {
            getTasks(request).add(new Task(title, description, dueDate));
        }
    }

    private void deleteTask(HttpServletRequest request) {
        Integer index = parseIndex(request.getParameter("index"));
        List<Task> tasks = getTasks(request);

        if (index != null && index >= 0 && index < tasks.size()) {
            tasks.remove((int) index);
        }
    }

    private void toggleTask(HttpServletRequest request) {
        Integer index = parseIndex(request.getParameter("index"));
        List<Task> tasks = getTasks(request);

        if (index != null && index >= 0 && index < tasks.size()) {
            Task task = tasks.get(index);
            task.setCompleted(!task.isCompleted());
        }
    }

    private String clean(String value) {
        return value == null ? "" : value.trim();
    }

    private LocalDate parseDate(String value) {
        try {
            return value == null || value.trim().isEmpty() ? null : LocalDate.parse(value);
        } catch (DateTimeParseException exception) {
            return null;
        }
    }

    private Integer parseIndex(String value) {
        try {
            return value == null ? null : Integer.parseInt(value);
        } catch (NumberFormatException exception) {
            return null;
        }
    }
}
