!function(l){var e=function(t,n){t=l(t);var i=this,a='li:has([data-toggle="tab"])',e=l.extend({},l.fn.bootstrapWizard.defaults,n),o=null,r=null;this.rebindClick=function(n,t){n.unbind("click",t).bind("click",t)},this.fixNavigationButtons=function(){if(o.length||(r.find("a:first").tab("show"),o=r.find(a+":first")),l(e.previousSelector,t).toggleClass("disabled",i.firstIndex()>=i.currentIndex()),l(e.nextSelector,t).toggleClass("disabled",i.currentIndex()>=i.navigationLength()),i.rebindClick(l(e.nextSelector,t),i.next),i.rebindClick(l(e.previousSelector,t),i.previous),i.rebindClick(l(e.lastSelector,t),i.last),i.rebindClick(l(e.firstSelector,t),i.first),e.onTabShow&&"function"==typeof e.onTabShow&&!1===e.onTabShow(o,r,i.currentIndex()))return!1},this.next=function(){return!t.hasClass("last")&&((!e.onNext||"function"!=typeof e.onNext||!1!==e.onNext(o,r,i.nextIndex()))&&($index=i.nextIndex(),void($index>i.navigationLength()||r.find(a+":eq("+$index+") a").tab("show"))))},this.previous=function(){return!t.hasClass("first")&&((!e.onPrevious||"function"!=typeof e.onPrevious||!1!==e.onPrevious(o,r,i.previousIndex()))&&($index=i.previousIndex(),void($index<0||r.find(a+":eq("+$index+") a").tab("show"))))},this.first=function(){return(!e.onFirst||"function"!=typeof e.onFirst||!1!==e.onFirst(o,r,i.firstIndex()))&&(!t.hasClass("disabled")&&void r.find(a+":eq(0) a").tab("show"))},this.last=function(){return(!e.onLast||"function"!=typeof e.onLast||!1!==e.onLast(o,r,i.lastIndex()))&&(!t.hasClass("disabled")&&void r.find(a+":eq("+i.navigationLength()+") a").tab("show"))},this.currentIndex=function(){return r.find(a).index(o)},this.firstIndex=function(){return 0},this.lastIndex=function(){return i.navigationLength()},this.getIndex=function(n){return r.find(a).index(n)},this.nextIndex=function(){return r.find(a).index(o)+1},this.previousIndex=function(){return r.find(a).index(o)-1},this.navigationLength=function(){return r.find(a).length-1},this.activeTab=function(){return o},this.nextTab=function(){return r.find(a+":eq("+(i.currentIndex()+1)+")").length?r.find(a+":eq("+(i.currentIndex()+1)+")"):null},this.previousTab=function(){return i.currentIndex()<=0?null:r.find(a+":eq("+parseInt(i.currentIndex()-1)+")")},this.show=function(n){return isNaN(n)?t.find(a+" a[href=#"+n+"]").tab("show"):t.find(a+":eq("+n+") a").tab("show")},this.disable=function(n){r.find(a+":eq("+n+")").addClass("disabled")},this.enable=function(n){r.find(a+":eq("+n+")").removeClass("disabled")},this.hide=function(n){r.find(a+":eq("+n+")").hide()},this.display=function(n){r.find(a+":eq("+n+")").show()},this.remove=function(n){var t=n[0],i="undefined"!=typeof n[1]&&n[1],e=r.find(a+":eq("+t+")");if(i){var o=e.find("a").attr("href");l(o).remove()}e.remove()};var s=function(n){var t=r.find(a).index(l(n.currentTarget).parent(a));if(e.onTabClick&&"function"==typeof e.onTabClick&&!1===e.onTabClick(o,r,i.currentIndex(),t))return!1},d=function(n){$element=l(n.target).parent();var t=r.find(a).index($element);return!$element.hasClass("disabled")&&((!e.onTabChange||"function"!=typeof e.onTabChange||!1!==e.onTabChange(o,r,i.currentIndex(),t))&&(o=$element,void i.fixNavigationButtons()))};this.resetWizard=function(){l('a[data-toggle="tab"]',r).off("click",s),l('a[data-toggle="tab"]',r).off("shown shown.bs.tab",d),r=t.find("ul:first",t),o=r.find(a+".active",t),l('a[data-toggle="tab"]',r).on("click",s),l('a[data-toggle="tab"]',r).on("shown shown.bs.tab",d),i.fixNavigationButtons()},r=t.find("ul:first",t),o=r.find(a+".active",t),r.hasClass(e.tabClass)||r.addClass(e.tabClass),e.onInit&&"function"==typeof e.onInit&&e.onInit(o,r,0),e.onShow&&"function"==typeof e.onShow&&e.onShow(o,r,i.nextIndex()),l('a[data-toggle="tab"]',r).on("click",s),l('a[data-toggle="tab"]',r).on("shown shown.bs.tab",d)};l.fn.bootstrapWizard=function(i){if("string"==typeof i){var n=Array.prototype.slice.call(arguments,1);return 1===n.length&&n.toString(),this.data("bootstrapWizard")[i](n)}return this.each(function(){var n=l(this);if(!n.data("bootstrapWizard")){var t=new e(n,i);n.data("bootstrapWizard",t),t.fixNavigationButtons()}})},l.fn.bootstrapWizard.defaults={tabClass:"nav nav-pills",nextSelector:".wizard li.next",previousSelector:".wizard li.previous",firstSelector:".wizard li.first",lastSelector:".wizard li.last",onShow:null,onInit:null,onNext:null,onPrevious:null,onLast:null,onFirst:null,onTabChange:null,onTabClick:null,onTabShow:null}}(jQuery);