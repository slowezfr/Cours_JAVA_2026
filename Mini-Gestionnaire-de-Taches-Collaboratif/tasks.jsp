<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String clean(String value) {
        return value == null ? "" : value.trim();
    }

    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }
        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }

    private Integer parseIndex(String value) {
        try {
            return value == null ? null : Integer.parseInt(value);
        } catch (NumberFormatException exception) {
            return null;
        }
    }
%>
<%
    List<Map<String, String>> tasks = (List<Map<String, String>>) session.getAttribute("miniSiteTasks");
    if (tasks == null) {
        tasks = new ArrayList<Map<String, String>>();
        session.setAttribute("miniSiteTasks", tasks);
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = clean(request.getParameter("title"));
            String description = clean(request.getParameter("description"));
            String dueDate = clean(request.getParameter("dueDate"));

            if (!title.isEmpty() && !description.isEmpty() && !dueDate.isEmpty()) {
                Map<String, String> task = new HashMap<String, String>();
                task.put("title", title);
                task.put("description", description);
                task.put("dueDate", dueDate);
                task.put("completed", "false");
                tasks.add(task);
            }
        } else if ("toggle".equals(action)) {
            Integer index = parseIndex(request.getParameter("index"));
            if (index != null && index >= 0 && index < tasks.size()) {
                Map<String, String> task = tasks.get(index);
                task.put("completed", "true".equals(task.get("completed")) ? "false" : "true");
            }
        } else if ("delete".equals(action)) {
            Integer index = parseIndex(request.getParameter("index"));
            if (index != null && index >= 0 && index < tasks.size()) {
                tasks.remove((int) index);
            }
        }

        response.sendRedirect("tasks.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des taches</title>
    <link rel="stylesheet" href="assets/site-style.css">
</head>
<body>
<header class="site-header">
    <nav class="top-nav" aria-label="Navigation principale">
        <a class="brand" href="index.jsp">Mini Gestionnaire</a>
        <div class="nav-links">
            <a href="../index.html">Cours Java</a>
            <a href="add-task.jsp">Ajouter</a>
            <a href="tasks.jsp">Taches</a>
        </div>
    </nav>
</header>

<main class="page">
    <section class="panel">
        <div class="section-heading">
            <div>
                <p class="eyebrow">Session utilisateur</p>
                <h1>Mes taches</h1>
            </div>
            <span class="counter"><%= tasks.size() %> tache(s)</span>
        </div>

        <% if (tasks.isEmpty()) { %>
            <div class="empty-state">
                <p>Aucune tache pour le moment.</p>
                <a class="button primary" href="add-task.jsp">Creer la premiere tache</a>
            </div>
        <% } else { %>
            <div class="task-list">
                <% for (int i = 0; i < tasks.size(); i++) {
                    Map<String, String> task = tasks.get(i);
                    boolean completed = "true".equals(task.get("completed"));
                    String completedClass = completed ? "completed" : "";
                    String statusClass = completed ? "done" : "todo";
                    String statusText = completed ? "Terminee" : "A faire";
                    String toggleText = completed ? "Remettre a faire" : "Marquer terminee";
                %>
                    <article class="task-card <%= completedClass %>">
                        <div class="task-content">
                            <div class="task-title-row">
                                <h2><%= escapeHtml(task.get("title")) %></h2>
                                <span class="status <%= statusClass %>"><%= statusText %></span>
                            </div>
                            <p><%= escapeHtml(task.get("description")) %></p>
                            <p class="due-date">Echeance : <%= escapeHtml(task.get("dueDate")) %></p>
                        </div>

                        <div class="task-actions">
                            <form action="tasks.jsp" method="post">
                                <input type="hidden" name="action" value="toggle">
                                <input type="hidden" name="index" value="<%= i %>">
                                <button class="button secondary" type="submit"><%= toggleText %></button>
                            </form>

                            <form action="tasks.jsp" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="index" value="<%= i %>">
                                <button class="button danger" type="submit">Supprimer</button>
                            </form>
                        </div>
                    </article>
                <% } %>
            </div>
        <% } %>
    </section>
</main>
</body>
</html>
