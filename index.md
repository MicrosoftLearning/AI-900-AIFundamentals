---
title: Online Hosted Instructions
permalink: index.html
layout: home
---

# Azure AI Fundamentals Exercises

This repository contains the hands-on lab exercises for Microsoft course [AI-900 *Microsoft Azure Artificial Intelligence*](https://docs.microsoft.com/en-us/learn/certifications/courses/ai-900t00) and the equivalent self-paced modules on Microsoft Learn: [Get started with artificial intelligence on Azure](https://docs.microsoft.com/learn/paths/get-started-with-artificial-intelligence-on-azure/), [Create no-code predictive models with Azure Machine Learning](https://docs.microsoft.com/en-us/learn/paths/create-no-code-predictive-models-azure-machine-learning/),  [Explore computer vision in Microsoft Azure](https://docs.microsoft.com/learn/paths/explore-computer-vision-microsoft-azure/), [Explore natural language processing](https://docs.microsoft.com/learn/paths/explore-natural-language-processing/), and [Explore conversational AI](https://docs.microsoft.com/learn/paths/explore-conversational-ai/). The exercises are designed to accompany the learning materials and enable you to practice using the technologies they describe. 

To complete these exercises, you'll need a Microsoft Azure subscription. If your instructor has not provided you with one, you can sign up for a free trial at [https://azure.microsoft.com](https://azure.microsoft.com).

{% assign labs = site.pages | where_exp:"page", "page.url contains '/instructions'" %}
| Exercises |
| ------- | 
{% for activity in labs  %}| [{{ activity.lab.title }}]({{ site.github.url }}{{ activity.url }}) |
{% endfor %}
