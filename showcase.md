---
title: "{{ replace .Name '-' ' ' | humanize }}"
description: "{{ replace .Name '-' ' ' | humanize }} is built with Hugo"
date: {{ .Date }}
featured: false
images:
- "/uploads/showcase/{{ .Name }}.jpg"
permalink:
weight:
---
