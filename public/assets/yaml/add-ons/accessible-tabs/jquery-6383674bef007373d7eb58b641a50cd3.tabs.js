/**
 * Accessible Tabs - jQuery plugin for accessible, unobtrusive tabs
 * Build to seemlessly work with the CCS-Framework YAML (yaml.de) not depending on YAML though
 * @requires jQuery - tested with 1.4.2 but might as well work with older versions
 *
 * english article: http://blog.ginader.de/archives/2009/02/07/jQuery-Accessible-Tabs-How-to-make-tabs-REALLY-accessible.php
 * german article: http://blog.ginader.de/archives/2009/02/07/jQuery-Accessible-Tabs-Wie-man-Tabs-WIRKLICH-zugaenglich-macht.php
 * 
 * code: http://github.com/ginader/Accessible-Tabs
 * please report issues at: http://github.com/ginader/Accessible-Tabs/issues
 *
 * Copyright (c) 2007 Dirk Ginader (ginader.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Version: 1.9.1
 * 
 * History:
 * * 1.0 initial release
 * * 1.1 added a lot of Accessibility enhancements
 * * * rewrite to use "fn.extend" structure
 * * * added check for existing ids on the content containers to use to proper anchors in the tabs
 * * 1.1.1 changed the headline markup. thanks to Mike Davies for the hint.
 * * 1.5 thanks to Dirk Jesse, Ansgar Hein, David Maciejewski and Mike West for commiting patches to this release
 * * * new option syncheights that syncs the heights of the tab contents when the SyncHeight plugin 
 * *   is available http://blog.ginader.de/dev/jquery/syncheight/index.php
 * * * fixed the hardcoded current class
 * * * new option tabsListClass to be applied to the generated list of tabs above the content so lists 
 * *   inside the tabscontent can be styled differently
 * * * added clearfix and tabcounter that adds a class in the schema "tabamount{number amount of tabs}" 
 * *   to the ul containg the tabs so one can style the tabs to fit 100% into the width
 * * * new option "syncHeightMethodName" fixed issue: http://github.com/ginader/Accessible-Tabs/issues/2/find
 * * * new Method showAccessibleTab({index number of the tab to show starting with 0})  fixed issue: http://github.com/ginader/Accessible-Tabs/issues/3/find
 * * * added support for the Cursor Keys to come closer to the WAI ARIA Tab Panel Best Practices http://github.com/ginader/Accessible-Tabs/issues/1/find
 * * 1.6 
 * * * new option "saveState" to allow tabs remember their selected state using cookies requires the cookie plugin: http://plugins.jquery.com/project/Cookie
 * * * changed supported jquery version to 1.4.2 to make sure it's future compatible
 * * * new option "autoAnchor" which allows to add ID's to headlines in the tabs markup that allow direct linking into a tab i.e.: file.html#headlineID
 * * 1.7
 * * * new option "pagination" that adds links to show the next/previous tab. This adds the following markup to each tab for you to style:
 <ul class="pagination">
     <li class="previous"><a href="#{the-id-of-the-previous-tab}"><span>{the headline of the previous tab}</span></a></li>
     <li class="next"><a href="#{the-id-of-the-next-tab}"><span>{the headline of the previous tab}</span></a></li>
 </ul>
 * * 1.8
 * * * new option "position" can be 'top' or 'bottom'. Defines where the tabs list is inserted. 
 * * 1.8.1
 * * * Bugfix for broken pagination in ie6 and 7: Selector and object access modified by Daniel Köntös (www.MilkmanMedia.de). Thanks to Carolin Moll for the report.
 * * 1.8.2
 * * * Bugfix for issue described by Sunshine here: http://blog.ginader.de/archives/2009/02/07/jQuery-Accessible-Tabs-How-to-make-tabs-REALLY-accessible.php#c916
 * * 1.8.3
 * * * Bugfix by Michael Schulze: Only change current class in tab navigation and not in all unordered lists inside the tabs.
 * * 1.9
 * * * new method showAccessibleTabSelector({valid jQuery selector of the tab to show}) that allows the opening of tabs \
 * * * by jQuery Selector instead of the index in showAccessibleTab() fixing issue https://github.com/ginader/Accessible-Tabs/issues/15
 * * 1.9.1 by Michael Schulze: 
 * * * firstNavItemClass and lastNavItemClass to define a custom classname on the first and last tab
 * * * wrapInnerNavLinks: inner wrap for a-tags in tab navigation.
 */
(function(a){function c(a,c){b&&window.console&&window.console.log&&(c?window.console.log(c+": ",a):window.console.log(a))}var b=!0;a.fn.extend({getUniqueId:function(a,b,c){return c===undefined?c="":c="-"+c,a+b+c},accessibleTabs:function(b){var d={wrapperClass:"content",currentClass:"current",tabhead:"h3",tabheadClass:"tabhead",tabbody:".tabbody",fx:"show",fxspeed:"normal",currentInfoText:"current tab: ",currentInfoPosition:"prepend",currentInfoClass:"current-info",tabsListClass:"tabs-list",syncheights:!1,syncHeightMethodName:"syncHeight",cssClassAvailable:!1,saveState:!1,autoAnchor:!1,pagination:!1,position:"top",wrapInnerNavLinks:"",firstNavItemClass:"first",lastNavItemClass:"last"},e={37:-1,38:-1,39:1,40:1},f={top:"prepend",bottom:"append"};this.options=a.extend(d,b);var g=this;return this.each(function(b){var d=a(this),h="",i=0;ids=[],a(d).wrapInner('<div class="'+g.options.wrapperClass+'"></div>'),a(d).find(g.options.tabhead).each(function(c){var d="";elId=a(this).attr("id"),elId&&(d=' id="'+elId+'"');var e=g.getUniqueId("accessibletabscontent",b,c),f=g.getUniqueId("accessibletabsnavigation",b,c);ids.push(e);if(g.options.cssClassAvailable===!0){var j="";a(this).attr("class")&&(j=a(this).attr("class"),j=' class="'+j+'"',h+='<li id="'+f+'"><a'+d+""+j+' href="#'+e+'">'+a(this).html()+"</a></li>")}else h+='<li id="'+f+'"><a'+d+' href="#'+e+'">'+a(this).html()+"</a></li>";a(this).attr({id:e,"class":g.options.tabheadClass,tabindex:"-1"}),i++}),g.options.syncheights&&a.fn[g.options.syncHeightMethodName]&&(a(d).find(g.options.tabbody)[g.options.syncHeightMethodName](),a(window).resize(function(){a(d).find(g.options.tabbody)[g.options.syncHeightMethodName]()})),a(d)[f[g.options.position]]('<ul class="clearfix '+g.options.tabsListClass+" tabamount"+i+'">'+h+"</ul>"),a(d).find(g.options.tabbody).hide(),a(d).find(g.options.tabbody+":first").show(),a(d).find("ul."+g.options.tabsListClass+">li:first").addClass(g.options.currentClass).addClass(g.options.firstNavItemClass).find("a")[g.options.currentInfoPosition]('<span class="'+g.options.currentInfoClass+'">'+g.options.currentInfoText+"</span>").parents("ul."+g.options.tabsListClass).children("li:last").addClass(g.options.lastNavItemClass),g.options.wrapInnerNavLinks&&a(d).find("ul."+g.options.tabsListClass+">li>a").wrapInner(g.options.wrapInnerNavLinks),a(d).find("ul."+g.options.tabsListClass+">li>a").each(function(b){a(this).click(function(c){c.preventDefault(),d.trigger("showTab.accessibleTabs",[a(c.target)]),g.options.saveState&&a.cookie&&a.cookie("accessibletab_"+d.attr("id")+"_active",b),a(d).find("ul."+g.options.tabsListClass+">li."+g.options.currentClass).removeClass(g.options.currentClass).find("span."+g.options.currentInfoClass).remove(),a(this).blur(),a(d).find(g.options.tabbody+":visible").hide(),a(d).find(g.options.tabbody).eq(b)[g.options.fx](g.options.fxspeed),a(this)[g.options.currentInfoPosition]('<span class="'+g.options.currentInfoClass+'">'+g.options.currentInfoText+"</span>").parent().addClass(g.options.currentClass),a(a(this).attr("href")).focus().keyup(function(c){e[c.keyCode]&&(g.showAccessibleTab(b+e[c.keyCode]),a(this).unbind("keyup"))})}),a(this).focus(function(c){a(document).keyup(function(a){e[a.keyCode]&&g.showAccessibleTab(b+e[a.keyCode])})}),a(this).blur(function(b){a(document).unbind("keyup")})});if(g.options.saveState&&a.cookie){var j=a.cookie("accessibletab_"+d.attr("id")+"_active");c(a.cookie("accessibletab_"+d.attr("id")+"_active")),j!==null&&g.showAccessibleTab(j,d.attr("id"))}if(g.options.autoAnchor&&window.location.hash){var k=a("."+g.options.tabsListClass).find(window.location.hash);k.size()&&k.click()}if(g.options.pagination){var l='<ul class="pagination">';l+='    <li class="previous"><a href="#{previousAnchor}"><span>{previousHeadline}</span></a></li>',l+='    <li class="next"><a href="#{nextAnchor}"><span>{nextHeadline}</span></a></li>',l+="</ul>";var m=a(d).find(".tabbody"),n=m.size();m.each(function(b){a(this).append(l);var c=b+1;c>=n&&(c=0);var e=b-1;e<0&&(e=n-1);var f=a(this).find(".pagination"),g=f.find(".previous");g.find("span").text(a("#"+ids[e]).text()),g.find("a").attr("href","#"+ids[e]).click(function(b){b.preventDefault(),a(d).find(".tabs-list a").eq(e).click()});var h=f.find(".next");h.find("span").text(a("#"+ids[c]).text()),h.find("a").attr("href","#"+ids[c]).click(function(b){b.preventDefault(),a(d).find(".tabs-list a").eq(c).click()})})}})},showAccessibleTab:function(b,d){c("showAccessibleTab");var e=this;if(!d)return this.each(function(){var c=a(this);c.trigger("showTab.accessibleTabs");var d=c.find("ul."+e.options.tabsListClass+">li>a");c.trigger("showTab.accessibleTabs",[d.eq(b)]),d.eq(b).click()});var f=a("#"+d),g=f.find("ul."+e.options.tabsListClass+">li>a");f.trigger("showTab.accessibleTabs",[g.eq(b)]),g.eq(b).click()},showAccessibleTabSelector:function(b){c("showAccessibleTabSelector");var d=this,e=a(b);e&&(e.get(0).nodeName.toLowerCase()=="a"?e.click():c("the selector of a showAccessibleTabSelector() call needs to point to a tabs headline!"))}})})(jQuery)