<%@ page import="fr.projet.model.Task" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<Task>();
        session.setAttribute("tasks", tasks);
    }
%>
<%!
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
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des taches</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
</head>
<body>
<main class="page">
    <header class="topbar">
        <a href="${pageContext.request.contextPath}/index.jsp">Accueil</a>
        <a href="${pageContext.request.contextPath}/add-task.jsp">Ajouter une tache</a>
    </header>

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
                <a class="button primary" href="${pageContext.request.contextPath}/add-task.jsp">Creer la premiere tache</a>
            </div>
        <% } else { %>
            <div class="task-list">
                <% for (int i = 0; i < tasks.size(); i++) {
                    Task task = tasks.get(i);
                    String completedClass = task.isCompleted() ? "completed" : "";
                    String statusClass = task.isCompleted() ? "done" : "todo";
                    String statusText = task.isCompleted() ? "Terminee" : "A faire";
                    String toggleText = task.isCompleted() ? "Remettre a faire" : "Marquer terminee";
                %>
                    <article class="task-card <%= completedClass %>">
                        <div class="task-content">
                            <div class="task-title-row">
                                <h2><%= escapeHtml(task.getTitle()) %></h2>
                                <span class="status <%= statusClass %>">
                                    <%= statusText %>
                                </span>
                            </div>
                            <p><%= escapeHtml(task.getDescription()) %></p>
                            <p class="due-date">Echeance : <%= task.getDueDate() %></p>
                        </div>

                        <div class="task-actions">
                            <form action="${pageContext.request.contextPath}/tasks" method="post">
                                <input type="hidden" name="action" value="toggle">
                                <input type="hidden" name="index" value="<%= i %>">
                                <button class="button secondary" type="submit">
                                    <%= toggleText %>
                                </button>
                            </form>

                            <form action="${pageContext.request.contextPath}/tasks" method="post">
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
