---
layout: page
title: Program
---


# Let's get Started!

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
  <div id="collapse{{daynum}}{{forloop.index0}}" class="accordion-collapse collapse {% if session.show  %}show{% endif %}" aria-labelledby="heading{{daynum}}{{forlop.index0}}" data-bs-parent="#accordion{{daynum}}">
  <div class="accordion-body">

   <!-- icebreaker -->
   {% if session.type == 'icebreaker' %}{% include icebreaker.html prompt=session.prompt example=session.example %}{% endif %}


   <!-- session description -->
   {% if session.description %}
   <h3>Description</h3>
   <p> {{ session.description }} </p>
   {% endif %}

   <!-- speaker and video -->
   {% if session.video %}
   <h3>Video Tutorial </h3>
   {% if session.time %} <strong>Video Length:</strong> {{session.time}} {% endif %}
   <div class="flex-row" style="margin-top:1em;">
    <div>
     <iframe width="560" height="315" src="https://www.youtube.com/embed/{{session.video}}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
   {% endif %}

   {% if session.speaker %}
    {% include instructor_card.html who=session.speaker %}
   {% endif %}
   </div><!-- end flex -->

   <!-- session links  -->
   {% include session_materials.html session=session %}
   <!-- end session links -->
  </div><!-- end accordion body -->
 </div><!-- end accordion item (training session) -->
{% endfor %}
</div><!-- end accordion (day) -->

{% endfor %}


