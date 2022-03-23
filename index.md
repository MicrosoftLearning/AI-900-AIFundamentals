---
title: Online Hosted Instructions
permalink: index.html
layout: home
---

# Azure AI Fundamentals Exercises

Use the links below to complete the hands-on lab exercises for Microsoft course [AI-900 *Microsoft Azure AI Fundamentals*](https://docs.microsoft.com/learn/certifications/courses/ai-900t00).

To complete these exercises, you'll need a Microsoft Azure subscription. If your instructor has not provided you with one, you can sign up for a free trial at [https://azure.microsoft.com](https://azure.microsoft.com).

{% assign labs = site.pages | where_exp:"page", "page.url contains '/instructions'" %}
| Exercises |
| ------- | 
{% for activity in labs  %}| [{{ activity.lab.title }}]({{ site.github.url }}{{ activity.url }}) |
{% endfor %}
