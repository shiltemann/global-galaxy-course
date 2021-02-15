---
layout: page
title: "GTN Smörgåsbord: A Global Galaxy Course"
---

![GTN logo](assets/images/logos/00_GTNLogo300.png){: style="float: right"}

In February 2021, we will organize a global 5-day [Galaxy](https://galaxyproject.org) Training event showcasing a wide variety of GTN (Galaxy Training Network) [tutorials](https://training.galaxyproject.org). This will be an **online** event, spanning **all time zones**. All training sessions are pre-recorded, so you can work through them **at your own pace**, and manage your own time. A large community of GTN trainers will be available via **online support** to answer all your questions.

The [program](#program) covers a general **introduction to the Galaxy platform**, **NGS Analysis (DNA-seq and RNA-seq)**, **Proteomics**, and also features a [**Choose your own adventure**](https://en.wikipedia.org/wiki/Choose_Your_Own_Adventure) day on Friday, where we encourage you to explore all the tutorials that the GTN training repository has to offer, and follow those that are of interest to you. The GTN tutorials cover a wide range of scientific topics, from NGS to ecology, climate science, machine learning, visualization, and many more. All the tutorials can be found on the [GTN website](https://training.galaxyproject.org)


## Start the Workshop!

Welcome! Click the button below to start the workshop!

<a href="{{site.baseurl}}/workshop"><button type="button" class="btn btn-success btn-lg">Start the Course!</button></a>


<br/><br/><br/>


## Practical Information

**When:** February 15-19, 2021 (all time zones) \\
**Who:** Open for everybody \\
**Cost:** Free \\
**Format:** Virtual and asynchronous. All training session are pre-recorded, you can work through these at your own pace, with instructors available online for support \\
**Support:** Slack Channel (<a href="{{site.support_join}}">invite link</a>) \\
**Contact:** [Saskia Hiltemann](mailto:saskiahiltemann@gmail.com) \\
**Organized by:** [The Galaxy Training Network (GTN)](https://training.galaxyproject.org/training-material/hall-of-fame), [CINECA](https://www.cineca-project.eu/), [The Gallantries Project](https://gallantries.github.io/), [The Galaxy Project](https://galaxyproject.org), [Australian BioCommons](https://www.biocommons.org.au/), [Erasmus Medical Center](https://www.erasmusmc.nl),
[Albert-Ludwigs-Universität Freiburg](https://uni-freiburg.de/), [Avans Hogeschool](https://www.avans.nl),  [University of Melbourne](https://www.unimelb.edu.au/), [The GalaxyP Team](http://galaxyp.org/), [The ProteoRE Team](http://www.proteore.org/), [INAB-CERTH](https://www.inab.certh.gr/), [EMBL-EBI](https://www.ebi.ac.uk/), [Institute of Surgical Pathology - University Medical Center Freiburg](https://www.uniklinik-freiburg.de/pathologie-en.html), [Centre National pour la Recherche Scientifique (CNRS)](http://www.cnrs.fr/), [Clermont Auvergne University](https://www.uca.fr/), <span title="South African National Bioinformatics Institute, South African MRC Bioinformatics Unit, University of the Western Cape, Bellville, 7535, South Africa">[SANBI/UWC](https://www.sanbi.org/)</span>, [EOSC-Nordic](https://www.eosc-nordic.eu/), [Institut Français de Bioinformatique](https://www.france-bioinformatique.fr/en/home/), [Birla Institute of Scientific Research](https://bisr.res.in/).

## Registration

Please fill out the **[registration form](https://forms.gle/TN3Tuet8wm4i2umv5)** to sign up for this course.


### Over 1100 Participants and counting!

<iframe width="718" height="445" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQZIwQfebT0jsjq1_e6S2pUzBZ4W0xwzYMPAQ2YiJNlqWn_Gr5EDHStmJ2MdxxaqXBzkRUyiy5MykPy/pubchart?oid=2136844584&amp;format=interactive"></iframe>

**Note:** Click [here](https://docs.google.com/spreadsheets/u/2/d/e/2PACX-1vQZIwQfebT0jsjq1_e6S2pUzBZ4W0xwzYMPAQ2YiJNlqWn_Gr5EDHStmJ2MdxxaqXBzkRUyiy5MykPy/pubhtml?gid=36645897&single=true) for exact numbers.

## Program


{% for day in site.data.training_sessions %}
 {% assign daynum = day[0] %}

 {% if day[1].subday %}
 <h4 class="daystart" style="margin-top:1em;"> {{day[1].title}} </h4>
 {% else %}
 <h3 class="daystart" style="margin-top:1em;"> {{day[1].title}} </h3>
 {% endif %}
 <p> {{day[1].description}} </p>

  {% assign daysessions = day[1].sessions %}
  {% assign selfstudy = day[1].selfstudy %}
  {% if daysessions %}
<table>
 <thead>
  <tr>
   <th>Topic</th>
   <th>Presentor</th>
  </tr>
 </thead>
 <tbody>
 {% for session in daysessions %}
 <tr>
 <td> {{session.name}} </td>
 <td>
  {% for speaker in session.speaker %}
   {{ site.data.instructors[speaker].name }}
  {% endfor %}
 </td>
 </tr>
 {% endfor %}
 </tbody>
</table>

  {% endif %}
{% endfor %} <!-- end schedule -->


## Instructors welcome!

Are you a trainer and would you like to teach (record) a GTN training session for the Choose your own Adventure day? Please see the [instructors page](/global-galaxy-course/instructors.html) for more information.

## Acknowledgements

This Global Galaxy course is only possible thanks to a Global network of instructors and institutes.

### Presenters & Instructors & Facilitators & Community Caption Contributors

{% include hof.html %}

### Institutions

{% include institutions.html %}
