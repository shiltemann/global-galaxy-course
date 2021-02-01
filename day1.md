---
layout: page
title: Day 1 Program
---


# Day 1

Welcome everybody! Thanks for joining this course.

Everything you need for this course can be found on this webpage.

Please start by watching the welcome video below. More information can be found by clicking on each session

{% for day in site.data.training_sessions %}
{% assign daynum = day[0] %}

# {{day[1].title}}

<div class="accordion" id="accordion{{daynum}}">
{% for session in day[1].sessions %}
 <div class="accordion-item">
  <h2 class="accordion-header" id="heading{{daynum}}{{forloop.index0}}">
   <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{daynum}}{{forloop.index0}}" aria-expanded="true" aria-controls="collapse{{daynum}}{{forloop.index0}}">
        {{session.name}}
   </button>
  </h2>
  <div id="collapse{{daynum}}{{forloop.index0}}" class="accordion-collapse collapse {% if forloop.index0 == 0 %}show{% endif %}" aria-labelledby="heading{{daynum}}{{forlop.index0}}" data-bs-parent="#accordion{{daynum}}">
  <div class="accordion-body">
   <strong>Speaker:</strong> {{session.speaker}}

   {{ session.type }}
   {% if session.description %}
   <p> {{ session.description }} </p>
   {% endif %}

   {% if session.type == 'icebreaker' %}
   <p> Come say Hi in Slack! Let us know you are joining today and getting started! </p>
   <p> Each day we will give you a prompt, for today, please tell us:
    <ul>
     <li> {{ session. prompt }} </li>
     <li> <strong>Example: </strong> {{ session. example }} </li>
    </ul>
   </p>
   <p><strong>Note:</strong> Please do this every day if you would like to receive a certificate of attendance</p>


     {% endif %}

     {% if session.video %}
     <iframe width="560" height="315" src="https://www.youtube.com/embed/{{session.video}}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
     {% endif %}


   </div>
   </div>
  </div><!-- end session -->
{% endfor %}
</div><!-- end accordion -->
{% endfor %}


