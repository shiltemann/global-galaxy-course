---
layout: page
title: Let's get Started!
---

Welcome everybody, and thank you for joining this course!

Everything you need for this course can be found on this webpage. More information including
links to all training materials can be found by clicking on each session

**Note:** You can also switch to the [rich view]({{site.baseurl}}/workshop) version of this page.

{% for day in site.data.training_sessions %}
 {% assign daynum = day[0] %}

 {% if day[1].subday %}
 <h4 class="daystart" style="margin-top:2em;"> {{day[1].title}} </h4>
 {% else %}
 <h2 class="daystart" style="margin-top:2em;"> {{day[1].title}} </h2>
 {% endif %}
 <p> {{day[1].description}} </p>

  {% assign daysessions = day[1].sessions %}
  {% assign selfstudy = day[1].selfstudy %}
  {% if daysessions %}
   {% include program_table.html sessions=daysessions fullprogram=true selfstudy=selfstudy %}
  {% endif %}
{% endfor %} <!-- end schedule -->
