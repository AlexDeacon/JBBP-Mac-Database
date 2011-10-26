/**
 * syncHeight - jQuery plugin to automagically Snyc the heights of columns
 * Made to seemlessly work with the CCS-Framework YAML (yaml.de)
 * @requires jQuery v1.0.3
 *
 * http://blog.ginader.de/dev/syncheight/
 *
 * Copyright (c) 2007-2009 
 * Dirk Ginader (ginader.de)
 * Dirk Jesse (yaml.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Version: 1.1
 *
 * Usage:
 	$(document).ready(function(){
		$('p').syncHeight();
	});
 */
(function(a){a.fn.syncHeight=function(b){var c={updateOnResize:!1},d=a.extend(c,b),e=this,f=0,g=0,h=[["min-height","0px"],["height","1%"]];return a.browser.msie&&a.browser.version<7&&(g=1),a(this).each(function(){a(this).css(h[g][0],h[g][1]);var b=a(this).height();b>f&&(f=b)}),a(this).each(function(){a(this).css(h[g][0],f+"px")}),d.updateOnResize==!0&&a(window).resize(function(){a(e).syncHeight()}),this}})(jQuery)