/*
Sequence.js (http://www.sequencejs.com)
Version: 1.0.1.1
Author: Ian Lunn @IanLunn
Author URL: http://www.ianlunn.co.uk/
Github: https://github.com/IanLunn/Sequence

This is a FREE script and is available under a MIT License:
http://www.opensource.org/licenses/mit-license.php

Sequence.js and its dependencies are (c) Ian Lunn Design 2012 - 2013 unless otherwise stated.

Sequence also relies on the following open source scripts:

- jQuery imagesLoaded 2.1.0 (http://github.com/desandro/imagesloaded)
	Paul Irish et al
	Available under a MIT License: http://www.opensource.org/licenses/mit-license.php

- jQuery TouchWipe 1.1.1 (http://www.netcu.de/jquery-touchwipe-iphone-ipad-library)
	Andreas Waltl, netCU Internetagentur (http://www.netcu.de)
	Available under a MIT License: http://www.opensource.org/licenses/mit-license.php

- Modernizr 2.6.1 Custom Build (http://modernizr.com/) (Named Modernizr for Sequence to prevent conflicts)
	Copyright (c) Faruk Ates, Paul Irish, Alex Sexton
	Available under the BSD and MIT licenses: www.modernizr.com/license/
	*/(function(e){
    function n(n,r,i,s){
        function f(){
            o.afterLoaded();
            o.settings.hideFramesUntilPreloaded&&o.settings.preloader!==undefined&&o.settings.preloader!==!1&&o.frames.show();
            if(o.settings.preloader!==undefined&&o.settings.preloader!==!1)if(o.settings.hidePreloaderUsingCSS&&o.transitionsSupported){
                o.prependPreloadingCompleteTo=o.settings.prependPreloadingComplete===!0?o.settings.preloader:e(o.settings.prependPreloadingComplete);
                o.prependPreloadingCompleteTo.addClass("preloading-complete");
                setTimeout(g,o.settings.hidePreloaderDelay)
                }else o.settings.preloader.fadeOut(o.settings.hidePreloaderDelay,function(){
                clearInterval(o.defaultPreloader);
                g()
                });else g()
                }
                function h(t,n){
            var r=[];
            if(!n)for(var i=t;i>0;i--)o.frames.eq(o.settings.preloadTheseFrames[i-1]-1).find("img").each(function(){
                r.push(e(this)[0])
                });else for(var s=t;s>0;s--)r.push(e("body").find('img[src="'+o.settings.preloadTheseImages[s-1]+'"]'));
            return r
            }
            function p(t,n){
            function c(){
                var t=e(f),r=e(l);
                s&&(l.length?s.reject(u,t,r):s.resolve(u));
                e.isFunction(n)&&n.call(i,u,t,r)
                }
                function h(t,n){
                if(t.src===r||e.inArray(t,a)!==-1)return;
                a.push(t);
                n?l.push(t):f.push(t);
                e.data(t,"imagesLoaded",{
                    isBroken:n,
                    src:t.src
                    });
                o&&s.notifyWith(e(t),[n,u,e(f),e(l)]);
                if(u.length===a.length){
                    setTimeout(c);
                    u.unbind(".imagesLoaded")
                    }
                }
            var r="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==",i=t,s=e.isFunction(e.Deferred)?e.Deferred():0,o=e.isFunction(s.notify),u=i.find("img").add(i.filter("img")),a=[],f=[],l=[];
        e.isPlainObject(n)&&e.each(n,function(e,t){
            e==="callback"?n=t:s&&s[e](t)
            });
        u.length?u.bind("load.imagesLoaded error.imagesLoaded",function(e){
            h(e.target,e.type==="error")
            }).each(function(t,n){
            var i=n.src,s=e.data(n,"imagesLoaded");
            if(s&&s.src===i){
                h(n,s.isBroken);
                return
            }
            if(n.complete&&n.naturalWidth!==undefined){
                h(n,n.naturalWidth===0||n.naturalHeight===0);
                return
            }
            if(n.readyState||n.complete){
                n.src=r;
                n.src=i
                }
            }):c()
    }
    function g(){
    function t(e,t){
        var r,i;
        for(i in t){
            i==="left"||i==="right"?r=n[i]:r=i;
            e===parseFloat(r)&&o._initCustomKeyEvent(t[i])
            }
        }
        function r(){
    o.canvas.on("touchmove.sequence",i);
    u=null;
    f=!1
    }
    function i(e){
    o.settings.swipePreventsDefault&&e.preventDefault();
    if(f){
        var t=e.originalEvent.touches[0].pageX,n=e.originalEvent.touches[0].pageY,i=u-t,s=a-n;
        if(Math.abs(i)>=o.settings.swipeThreshold){
            r();
            i>0?o._initCustomKeyEvent(o.settings.swipeEvents.left):o._initCustomKeyEvent(o.settings.swipeEvents.right)
            }else if(Math.abs(s)>=o.settings.swipeThreshold){
            r();
            s>0?o._initCustomKeyEvent(o.settings.swipeEvents.down):o._initCustomKeyEvent(o.settings.swipeEvents.up)
            }
        }
}
function s(e){
    if(e.originalEvent.touches.length===1){
        u=e.originalEvent.touches[0].pageX;
        a=e.originalEvent.touches[0].pageY;
        f=!0;
        o.canvas.on("touchmove.sequence",i)
        }
    }
e(o.settings.preloader).remove();
o.nextButton=o._renderUiElements(o.settings.nextButton,".sequence-next");
o.prevButton=o._renderUiElements(o.settings.prevButton,".sequence-prev");
o.pauseButton=o._renderUiElements(o.settings.pauseButton,".sequence-pause");
o.pagination=o._renderUiElements(o.settings.pagination,".sequence-pagination");
o.nextButton!==undefined&&o.nextButton!==!1&&o.settings.showNextButtonOnInit===!0&&o.nextButton.show();
o.prevButton!==undefined&&o.prevButton!==!1&&o.settings.showPrevButtonOnInit===!0&&o.prevButton.show();
o.pauseButton!==undefined&&o.pauseButton!==!1&&o.settings.showPauseButtonOnInit===!0&&o.pauseButton.show();
if(o.settings.pauseIcon!==!1){
    o.pauseIcon=o._renderUiElements(o.settings.pauseIcon,".sequence-pause-icon");
    o.pauseIcon!==undefined&&o.pauseIcon.hide()
    }else o.pauseIcon=undefined;
if(o.pagination!==undefined&&o.pagination!==!1){
    o.paginationLinks=o.pagination.children();
    o.paginationLinks.on("click.sequence",function(){
        var t=e(this).index()+1;
        o.goTo(t)
        });
    o.settings.showPaginationOnInit===!0&&o.pagination.show()
    }
    o.nextFrameID=o.settings.startingFrameID;
if(o.settings.hashTags===!0){
    o.frames.each(function(){
        o.frameHashID.push(e(this).prop(o.getHashTagFrom))
        });
    o.currentHashTag=location.hash.replace("#","");
    if(o.currentHashTag===undefined||o.currentHashTag==="")o.nextFrameID=o.settings.startingFrameID;
    else{
        o.frameHashIndex=e.inArray(o.currentHashTag,o.frameHashID);
        o.frameHashIndex!==-1?o.nextFrameID=o.frameHashIndex+1:o.nextFrameID=o.settings.startingFrameID
        }
    }
o.nextFrame=o.frames.eq(o.nextFrameID-1);
o.nextFrameChildren=o.nextFrame.children();
o.pagination!==undefined&&e(o.paginationLinks[o.settings.startingFrameID-1]).addClass("current");
if(o.transitionsSupported)if(!o.settings.animateStartingFrameIn){
    o.currentFrameID=o.nextFrameID;
    o.settings.moveActiveFrameToTop&&o.nextFrame.css("z-index",o.numberOfFrames);
    o._resetElements(o.transitionPrefix,o.nextFrameChildren,"0s");
    o.nextFrame.addClass("animate-in");
    if(o.settings.hashTags&&o.settings.hashChangesOnFirstFrame){
        o.currentHashTag=o.nextFrame.prop(o.getHashTagFrom);
        document.location.hash="#"+o.currentHashTag
        }
        setTimeout(function(){
        o._resetElements(o.transitionPrefix,o.nextFrameChildren,"")
        },100);
    o._resetAutoPlay(!0,o.settings.autoPlayDelay)
    }else if(o.settings.reverseAnimationsWhenNavigatingBackwards&&o.settings.autoPlayDirection-1&&o.settings.animateStartingFrameIn){
    o._resetElements(o.transitionPrefix,o.nextFrameChildren,"0s");
    o.nextFrame.addClass("animate-out");
    o.goTo(o.nextFrameID,-1,!0)
    }else o.goTo(o.nextFrameID,1,!0);
else{
    o.container.addClass("sequence-fallback");
    o.currentFrameID=o.nextFrameID;
    if(o.settings.hashTags&&o.settings.hashChangesOnFirstFrame){
        o.currentHashTag=o.nextFrame.prop(o.getHashTagFrom);
        document.location.hash="#"+o.currentHashTag
        }
        o.frames.addClass("animate-in");
    o.frames.not(":eq("+(o.nextFrameID-1)+")").css({
        display:"none",
        opacity:0
    });
    o._resetAutoPlay(!0,o.settings.autoPlayDelay)
    }
    o.nextButton!==undefined&&o.nextButton.bind("click.sequence",function(){
    o.next()
    });
o.prevButton!==undefined&&o.prevButton.bind("click.sequence",function(){
    o.prev()
    });
o.pauseButton!==undefined&&o.pauseButton.bind("click.sequence",function(){
    o.pause(!0)
    });
if(o.settings.keyNavigation){
    var n={
        left:37,
        right:39
    };
    
    e(document).bind("keydown.sequence",function(e){
        var n=String.fromCharCode(e.keyCode);
        if(n>0&&n<=o.numberOfFrames&&o.settings.numericKeysGoToFrames){
            o.nextFrameID=n;
            o.goTo(o.nextFrameID)
            }
            t(e.keyCode,o.settings.keyEvents);
        t(e.keyCode,o.settings.customKeyEvents)
        })
    }
    o.canvas.on({
    "mouseenter.sequence":function(){
        if(o.settings.pauseOnHover&&o.settings.autoPlay&&!o.hasTouch){
            o.isBeingHoveredOver=!0;
            o.isHardPaused||o.pause()
            }
        },
"mouseleave.sequence":function(){
    if(o.settings.pauseOnHover&&o.settings.autoPlay&&!o.hasTouch){
        o.isBeingHoveredOver=!1;
        o.isHardPaused||o.unpause()
        }
    }
});
o.settings.hashTags&&e(window).bind("hashchange.sequence",function(){
    var t=location.hash.replace("#","");
    if(o.currentHashTag!==t){
        o.currentHashTag=t;
        o.frameHashIndex=e.inArray(o.currentHashTag,o.frameHashID);
        if(o.frameHashIndex!==-1){
            o.nextFrameID=o.frameHashIndex+1;
            o.goTo(o.nextFrameID)
            }
        }
});
if(o.settings.swipeNavigation&&o.hasTouch){
    var u,a,f=!1;
    o.canvas.on("touchstart.sequence",s)
    }
}
var o=this;
o.container=e(n);
o.canvas=o.container.children(".sequence-canvas");
o.frames=o.canvas.children("li");
o._modernizrForSequence();
var u={
    WebkitTransition:"-webkit-",
    WebkitAnimation:"-webkit-",
    MozTransition:"-moz-",
    "MozAnimation ":"-moz-",
    OTransition:"-o-",
    OAnimation:"-o-",
    msTransition:"-ms-",
    msAnimation:"-ms-",
    transition:"",
    animation:""
},a={
    WebkitTransition:"webkitTransitionEnd.sequence",
    WebkitAnimation:"webkitAnimationEnd.sequence",
    MozTransition:"transitionend.sequence",
    MozAnimation:"animationend.sequence",
    OTransition:"otransitionend.sequence",
    OAnimation:"oanimationend.sequence",
    msTransition:"MSTransitionEnd.sequence",
    msAnimation:"MSAnimationEnd.sequence",
    transition:"transitionend.sequence",
    animation:"animationend.sequence"
};

o.transitionPrefix=u[ModernizrForSequence.prefixed("transition")],o.animationPrefix=u[ModernizrForSequence.prefixed("animation")],o.transitionProperties={},o.transitionEnd=a[ModernizrForSequence.prefixed("transition")]+" "+a[ModernizrForSequence.prefixed("animation")],o.numberOfFrames=o.frames.length,o.transitionsSupported=o.transitionPrefix!==undefined?!0:!1,o.hasTouch="ontouchstart"in window?!0:!1,o.isPaused=!1,o.isBeingHoveredOver=!1,o.container.removeClass("sequence-destroyed");
o.paused=function(){},o.unpaused=function(){},o.beforeNextFrameAnimatesIn=function(){},o.afterNextFrameAnimatesIn=function(){},o.beforeCurrentFrameAnimatesOut=function(){},o.afterCurrentFrameAnimatesOut=function(){},o.afterLoaded=function(){};

o.destroyed=function(){};

o.settings=e.extend({},i,r);
o.settings.preloader=o._renderUiElements(o.settings.preloader,".sequence-preloader");
o.isStartingFrame=o.settings.animateStartingFrameIn?!0:!1;
o.settings.unpauseDelay=o.settings.unpauseDelay===null?o.settings.autoPlayDelay:o.settings.unpauseDelay;
o.getHashTagFrom=o.settings.hashDataAttribute?"data-sequence-hashtag":"id";
o.frameHashID=[];
o.direction=o.settings.autoPlayDirection;
o.settings.hideFramesUntilPreloaded&&o.settings.preloader!==undefined&&o.settings.preloader!==!1&&o.frames.hide();
o.transitionPrefix==="-o-"&&(o.transitionsSupported=o._operaTest());
o.frames.removeClass("animate-in");
var l=o.settings.preloadTheseFrames.length,c=o.settings.preloadTheseImages.length;
if(o.settings.preloader===undefined||o.settings.preloader===!1||l===0&&c===0)if(t===!0){
    f();
    e(this).unbind("load.sequence")
    }else e(window).bind("load.sequence",function(){
    f();
    e(this).unbind("load.sequence")
    });
else{
    var d=h(l),v=h(c,!0),m=e(d.concat(v));
    p(m,f)
    }
}
var t=!1;
e(window).bind("load",function(){
    t=!0
    });
n.prototype={
    startAutoPlay:function(e){
        var t=this;
        e=e===undefined?t.settings.autoPlayDelay:e;
        t.unpause();
        t._resetAutoPlay();
        t.autoPlayTimer=setTimeout(function(){
            t.settings.autoPlayDirection===1?t.next():t.prev()
            },e)
        },
    stopAutoPlay:function(){
        var e=this;
        e.pause(!0);
        clearTimeout(e.autoPlayTimer)
        },
    pause:function(e){
        var t=this;
        if(!t.isSoftPaused){
            if(t.pauseButton!==undefined){
                t.pauseButton.addClass("paused");
                t.pauseIcon!==undefined&&t.pauseIcon.show()
                }
                t.paused();
            t.isSoftPaused=!0;
            t.isHardPaused=e?!0:!1;
            t.isPaused=!0;
            t._resetAutoPlay()
            }else t.unpause()
            },
    unpause:function(e){
        var t=this;
        if(t.pauseButton!==undefined){
            t.pauseButton.removeClass("paused");
            t.pauseIcon!==undefined&&t.pauseIcon.hide()
            }
            t.isSoftPaused=!1;
        t.isHardPaused=!1;
        t.isPaused=!1;
        if(!t.active){
            e!==!1&&t.unpaused();
            t._resetAutoPlay(!0,t.settings.unpauseDelay)
            }else t.delayUnpause=!0
            },
    next:function(){
        var e=this;
        id=e.currentFrameID!==e.numberOfFrames?e.currentFrameID+1:1;
        e.active===!1||e.active===undefined?e.goTo(id,1):e.goTo(id,1,!0)
        },
    prev:function(){
        var e=this;
        id=e.currentFrameID===1?e.numberOfFrames:e.currentFrameID-1;
        e.active===!1||e.active===undefined?e.goTo(id,-1):e.goTo(id,-1,!0)
        },
    goTo:function(t,n,r){
        var i=this;
        i.nextFrameID=parseFloat(t);
        var s=r===!0?0:i.settings.transitionThreshold;
        if(i.nextFrameID===i.currentFrameID||i.settings.navigationSkip&&i.navigationSkipThresholdActive||!i.settings.navigationSkip&&i.active||!i.transitionsSupported&&i.active||!i.settings.cycle&&n===1&&i.currentFrameID===i.numberOfFrames||!i.settings.cycle&&n===-1&&i.currentFrameID===1||i.settings.preventReverseSkipping&&i.direction!==n&&i.active)return!1;
        if(i.settings.navigationSkip&&i.active){
            i.navigationSkipThresholdActive=!0;
            i.settings.fadeFrameWhenSkipped&&i.nextFrame.stop().animate({
                opacity:0
            },i.settings.fadeFrameTime);
            clearTimeout(i.transitionThresholdTimer);
            setTimeout(function(){
                i.navigationSkipThresholdActive=!1
                },i.settings.navigationSkipThreshold)
            }
            if(!i.active||i.settings.navigationSkip){
            i.active=!0;
            i._resetAutoPlay();
            n===undefined?i.direction=i.nextFrameID>i.currentFrameID?1:-1:i.direction=n;
            i.currentFrame=i.canvas.children(".animate-in");
            i.nextFrame=i.frames.eq(i.nextFrameID-1);
            i.currentFrameChildren=i.currentFrame.children();
            i.nextFrameChildren=i.nextFrame.children();
            if(i.pagination!==undefined){
                i.paginationLinks.removeClass("current");
                e(i.paginationLinks[i.nextFrameID-1]).addClass("current")
                }
                if(i.transitionsSupported){
                if(i.currentFrame.length!==undefined){
                    i.beforeCurrentFrameAnimatesOut();
                    i.settings.moveActiveFrameToTop&&i.currentFrame.css("z-index",1);
                    i._resetElements(i.transitionPrefix,i.nextFrameChildren,"0s");
                    if(!i.settings.reverseAnimationsWhenNavigatingBackwards||i.direction===1){
                        i.nextFrame.removeClass("animate-out");
                        i._resetElements(i.transitionPrefix,i.currentFrameChildren,"")
                        }else if(i.settings.reverseAnimationsWhenNavigatingBackwards&&i.direction===-1){
                        i.nextFrame.addClass("animate-out");
                        i._reverseTransitionProperties()
                        }
                    }else i.isStartingFrame=!1;
            i.active=!0;
            i.currentFrame.unbind(i.transitionEnd);
            i.nextFrame.unbind(i.transitionEnd);
            i.settings.fadeFrameWhenSkipped&&i.settings.navigationSkip&&i.nextFrame.css("opacity",1);
            i.beforeNextFrameAnimatesIn();
            i.settings.moveActiveFrameToTop&&i.nextFrame.css("z-index",i.numberOfFrames);
            if(!i.settings.reverseAnimationsWhenNavigatingBackwards||i.direction===1){
                setTimeout(function(){
                    i._resetElements(i.transitionPrefix,i.nextFrameChildren,"");
                    i._waitForAnimationsToComplete(i.nextFrame,i.nextFrameChildren,"in");
                    (i.afterCurrentFrameAnimatesOut!=="function () {}"||i.settings.transitionThreshold===!0&&r!==!0)&&i._waitForAnimationsToComplete(i.currentFrame,i.currentFrameChildren,"out",!0,1)
                    },50);
                setTimeout(function(){
                    if(i.settings.transitionThreshold===!1||i.settings.transitionThreshold===0||r===!0){
                        i.currentFrame.toggleClass("animate-out animate-in");
                        i.nextFrame.addClass("animate-in")
                        }else{
                        i.currentFrame.toggleClass("animate-out animate-in");
                        i.settings.transitionThreshold!==!0&&(i.transitionThresholdTimer=setTimeout(function(){
                            i.nextFrame.addClass("animate-in")
                            },s))
                        }
                    },50)
            }else if(i.settings.reverseAnimationsWhenNavigatingBackwards&&i.direction===-1){
            setTimeout(function(){
                i._resetElements(i.transitionPrefix,i.currentFrameChildren,"");
                i._resetElements(i.transitionPrefix,i.nextFrameChildren,"");
                i._reverseTransitionProperties();
                i._waitForAnimationsToComplete(i.nextFrame,i.nextFrameChildren,"in");
                (i.afterCurrentFrameAnimatesOut!=="function () {}"||i.settings.transitionThreshold===!0&&r!==!0)&&i._waitForAnimationsToComplete(i.currentFrame,i.currentFrameChildren,"out",!0,-1)
                },50);
            setTimeout(function(){
                if(i.settings.transitionThreshold===!1||i.settings.transitionThreshold===0||r===!0){
                    i.currentFrame.removeClass("animate-in");
                    i.nextFrame.toggleClass("animate-out animate-in")
                    }else{
                    i.currentFrame.removeClass("animate-in");
                    i.settings.transitionThreshold!==!0&&(i.transitionThresholdTimer=setTimeout(function(){
                        i.nextFrame.toggleClass("animate-out animate-in")
                        },s))
                    }
                },50)
        }
    }else{
    function o(){
        i._setHashTag();
        i.active=!1;
        i._resetAutoPlay(!0,i.settings.autoPlayDelay)
        }
        switch(i.settings.fallback.theme){
        case"fade":
            i.frames.css({
            position:"relative"
        });
        i.beforeCurrentFrameAnimatesOut();
            i.currentFrame=i.frames.eq(i.currentFrameID-1);
            i.currentFrame.animate({
            opacity:0
        },i.settings.fallback.speed,function(){
            i.currentFrame.css({
                display:"none",
                "z-index":"1"
            });
            i.afterCurrentFrameAnimatesOut();
            i.beforeNextFrameAnimatesIn();
            i.nextFrame.css({
                display:"block",
                "z-index":i.numberOfFrames
                }).animate({
                opacity:1
            },500,function(){
                i.afterNextFrameAnimatesIn()
                });
            o()
            });
        i.frames.css({
            position:"relative"
        });
        break;
        case"slide":default:
            var u={},a={},f={};
            
            if(i.direction===1){
            u.left="-100%";
            a.left="100%"
            }else{
            u.left="100%";
            a.left="-100%"
            }
            f.left="0";
        f.opacity=1;
        i.currentFrame=i.frames.eq(i.currentFrameID-1);
            i.beforeCurrentFrameAnimatesOut();
            i.currentFrame.animate(u,i.settings.fallback.speed,function(){
            i.currentFrame.css({
                display:"none",
                "z-index":"1"
            });
            i.afterCurrentFrameAnimatesOut()
            });
        i.beforeNextFrameAnimatesIn();
            i.nextFrame.show().css(a);
            i.nextFrame.css({
            display:"block",
            "z-index":i.numberOfFrames
            }).animate(f,i.settings.fallback.speed,function(){
            o();
            i.afterNextFrameAnimatesIn()
            })
        }
        }
i.currentFrameID=i.nextFrameID
}
},
destroy:function(t){
    var n=this;
    n.container.addClass("sequence-destroyed");
    n.nextButton!==undefined&&n.nextButton.unbind("click.sequence");
    n.prevButton!==undefined&&n.prevButton.unbind("click.sequence");
    n.pauseButton!==undefined&&n.pauseButton.unbind("click.sequence");
    n.pagination!==undefined&&n.paginationLinks.unbind("click.sequence");
    e(document).unbind("keydown.sequence");
    n.canvas.unbind("mouseenter.sequence, mouseleave.sequence, touchstart.sequence, touchmove.sequence");
    e(window).unbind("hashchange.sequence");
    n.stopAutoPlay();
    clearTimeout(n.transitionThresholdTimer);
    n.canvas.children("li").remove();
    n.canvas.prepend(n.frames);
    n.frames.removeClass("animate-in animate-out").removeAttr("style");
    n.frames.eq(n.currentFrameID-1).addClass("animate-in");
    n.nextButton!==undefined&&n.nextButton!==!1&&n.nextButton.hide();
    n.prevButton!==undefined&&n.prevButton!==!1&&n.prevButton.hide();
    n.pauseButton!==undefined&&n.pauseButton!==!1&&n.pauseButton.hide();
    n.pauseIcon!==undefined&&n.pauseIcon!==!1&&n.pauseIcon.hide();
    n.pagination!==undefined&&n.pagination!==!1&&n.pagination.hide();
    t!==undefined&&t();
    n.destroyed();
    n.container.removeData()
    },
_initCustomKeyEvent:function(e){
    var t=this;
    switch(e){
        case"next":
            t.next();
            break;
        case"prev":
            t.prev();
            break;
        case"pause":
            t.pause(!0)
            }
        },
_resetElements:function(e,t,n){
    var r=this;
    t.css(r._prefixCSS(e,{
        "transition-duration":n,
        "transition-delay":n,
        "transition-timing-function":""
    }))
    },
_reverseTransitionProperties:function(){
    var t=this,n=[],r=[];
    t.currentFrameChildren.each(function(){
        n.push(parseFloat(e(this).css(t.transitionPrefix+"transition-duration").replace("s",""))+parseFloat(e(this).css(t.transitionPrefix+"transition-delay").replace("s","")))
        });
    t.nextFrameChildren.each(function(){
        r.push(parseFloat(e(this).css(t.transitionPrefix+"transition-duration").replace("s",""))+parseFloat(e(this).css(t.transitionPrefix+"transition-delay").replace("s","")))
        });
    var i=Math.max.apply(Math,n),s=Math.max.apply(Math,r),o=i-s,u=0,a=0;
    o<0&&!t.settings.preventDelayWhenReversingAnimations?u=Math.abs(o):o>0&&(a=Math.abs(o));
    var f=function(n,r,i,s){
        function o(e){
            e=e.split(",")[0];
            var t={
                linear:"cubic-bezier(0.0,0.0,1.0,1.0)",
                ease:"cubic-bezier(0.25, 0.1, 0.25, 1.0)",
                "ease-in":"cubic-bezier(0.42, 0.0, 1.0, 1.0)",
                "ease-in-out":"cubic-bezier(0.42, 0.0, 0.58, 1.0)",
                "ease-out":"cubic-bezier(0.0, 0.0, 0.58, 1.0)"
            };
            
            e.indexOf("cubic-bezier")<0&&(e=t[e]);
            return e
            }
            r.each(function(){
            var r=parseFloat(e(this).css(t.transitionPrefix+"transition-duration").replace("s","")),u=parseFloat(e(this).css(t.transitionPrefix+"transition-delay").replace("s","")),a=e(this).css(t.transitionPrefix+"transition-timing-function");
            if(a.indexOf("cubic")===-1)var a=o(a);
            var f=a.replace("cubic-bezier(","").replace(")","").split(",");
            e.each(f,function(e,t){
                f[e]=parseFloat(t)
                });
            var l=[1-f[2],1-f[3],1-f[0],1-f[1]];
            a="cubic-bezier("+l+")";
            var c=r+u;
            n["transition-duration"]=r+"s";
            n["transition-delay"]=i-c+s+"s";
            n["transition-timing-function"]=a;
            e(this).css(t._prefixCSS(t.transitionPrefix,n))
            })
        };
        
    f(t.transitionProperties,t.currentFrameChildren,i,u);
    f(t.transitionProperties,t.nextFrameChildren,s,a)
    },
_prefixCSS:function(e,t){
    var n=this,r={};
    
    for(var i in t)r[e+i]=t[i];return r
    },
_resetAutoPlay:function(e,t){
    var n=this;
    if(e===!0){
        if(n.settings.autoPlay&&!n.isSoftPaused){
            clearTimeout(n.autoPlayTimer);
            n.autoPlayTimer=setTimeout(function(){
                n.settings.autoPlayDirection===1?n.next():n.prev()
                },t)
            }
        }else clearTimeout(n.autoPlayTimer)
    },
_renderUiElements:function(t,n){
    var r=this;
    switch(t){
        case!1:
            return undefined;
        case!0:
            n===".sequence-preloader"&&r._defaultPreloader(r.container,r.transitionsSupported,r.animationPrefix);
            return e(n);
        default:
            return e(t)
            }
        },
_waitForAnimationsToComplete:function(t,n,r,i,s){
    var o=this;
    if(r==="out")var u=function(){
        o.afterCurrentFrameAnimatesOut();
        o.settings.transitionThreshold===!0&&(s===1?o.nextFrame.addClass("animate-in"):s===-1&&o.nextFrame.toggleClass("animate-out animate-in"))
        };
    else if(r==="in")var u=function(){
        o.afterNextFrameAnimatesIn();
        o._setHashTag();
        o.active=!1;
        if(!o.isHardPaused&&!o.isBeingHoveredOver)if(!o.delayUnpause)o.unpause(!1);
            else{
            o.delayUnpause=!1;
            o.unpause()
            }
        };
        
n.data("animationEnded",!1);
t.bind(o.transitionEnd,function(r){
    e(r.target).data("animationEnded",!0);
    var i=!0;
    n.each(function(){
        if(e(this).data("animationEnded")===!1){
            i=!1;
            return!1
            }
        });
if(i){
    t.unbind(o.transitionEnd);
    u()
    }
})
},
_setHashTag:function(){
    var t=this;
    if(t.settings.hashTags){
        t.currentHashTag=t.nextFrame.prop(t.getHashTagFrom);
        t.frameHashIndex=e.inArray(t.currentHashTag,t.frameHashID);
        if(t.frameHashIndex!==-1&&(t.settings.hashChangesOnFirstFrame||!t.isStartingFrame||!t.transitionsSupported)){
            t.nextFrameID=t.frameHashIndex+1;
            document.location.hash="#"+t.currentHashTag
            }else{
            t.nextFrameID=t.settings.startingFrameID;
            t.isStartingFrame=!1
            }
        }
},
_modernizrForSequence:function(){
    window.ModernizrForSequence=function(e,t,n){
        function r(e){
            v.cssText=e
            }
            function i(e,t){
            return r(prefixes.join(e+";")+(t||""))
            }
            function s(e,t){
            return typeof e===t
            }
            function o(e,t){
            return!!~(""+e).indexOf(t)
            }
            function u(e,t){
            for(var r in e){
                var i=e[r];
                if(!o(i,"-")&&v[i]!==n)return t=="pfx"?i:!0
                    }
                    return!1
            }
            function a(e,t,r){
            for(var i in e){
                var o=t[e[i]];
                if(o!==n)return r===!1?e[i]:s(o,"function")?o.bind(r||t):o
                    }
                    return!1
            }
            function f(e,t,n){
            var r=e.charAt(0).toUpperCase()+e.slice(1),i=(e+" "+b.join(r+" ")+r).split(" ");
            return s(t,"string")||s(t,"undefined")?u(i,t):(i=(e+" "+w.join(r+" ")+r).split(" "),a(i,t,n))
            }
            var l="2.6.1",c={},h=t.documentElement,p="modernizrForSequence",d=t.createElement(p),v=d.style,m,g={}.toString,y="Webkit Moz O ms",b=y.split(" "),w=y.toLowerCase().split(" "),E={
            svg:"http://www.w3.org/2000/svg"
        },S={},x={},T={},N=[],C=N.slice,k,L={}.hasOwnProperty,A;
        !s(L,"undefined")&&!s(L.call,"undefined")?A=function(e,t){
            return L.call(e,t)
            }:A=function(e,t){
            return t in e&&s(e.constructor.prototype[t],"undefined")
            },Function.prototype.bind||(Function.prototype.bind=function(e){
            var t=self;
            if(typeof t!="function")throw new TypeError;
            var n=C.call(arguments,1),r=function(){
                if(self instanceof r){
                    var i=function(){};
                    
                    i.prototype=t.prototype;
                    var s=new i,o=t.apply(s,n.concat(C.call(arguments)));
                    return Object(o)===o?o:s
                    }
                    return t.apply(e,n.concat(C.call(arguments)))
                };
                
            return r
            }),S.svg=function(){
            return!!t.createElementNS&&!!t.createElementNS(E.svg,"svg").createSVGRect
            };
            
        for(var O in S)A(S,O)&&(k=O.toLowerCase(),c[k]=S[O](),N.push((c[k]?"":"no-")+k));return c.addTest=function(e,t){
            if(typeof e=="object")for(var r in e)A(e,r)&&c.addTest(r,e[r]);else{
                e=e.toLowerCase();
                if(c[e]!==n)return c;
                t=typeof t=="function"?t():t,enableClasses&&(h.className+=" "+(t?"":"no-")+e),c[e]=t
                }
                return c
            },r(""),d=m=null,c._version=l,c._domPrefixes=w,c._cssomPrefixes=b,c.testProp=function(e){
            return u([e])
            },c.testAllProps=f,c.prefixed=function(e,t,n){
            return t?f(e,t,n):f(e,"pfx")
            },c
        }(self,self.document)
    },
_defaultPreloader:function(t,n,r){
    var i='<div class="sequence-preloader"><svg class="preloading" xmlns="http://www.w3.org/2000/svg"><circle class="circle" cx="6" cy="6" r="6" /><circle class="circle" cx="22" cy="6" r="6" /><circle class="circle" cx="38" cy="6" r="6" /></svg></div>';
    e("head").append("<style>.sequence-preloader{height: 100%;position: absolute;width: 100%;z-index: 999999;}@"+r+"keyframes preload{0%{opacity: 1;}50%{opacity: 0;}100%{opacity: 1;}}.sequence-preloader .preloading .circle{fill: #ff9442;display: inline-block;height: 12px;position: relative;top: -50%;width: 12px;"+r+"animation: preload 1s infinite; animation: preload 1s infinite;}.preloading{display:block;height: 12px;margin: 0 auto;top: 50%;margin-top:-6px;position: relative;width: 48px;}.sequence-preloader .preloading .circle:nth-child(2){"+r+"animation-delay: .15s; animation-delay: .15s;}.sequence-preloader .preloading .circle:nth-child(3){"+r+"animation-delay: .3s; animation-delay: .3s;}.preloading-complete{opacity: 0;visibility: hidden;"+r+"transition-duration: 1s; transition-duration: 1s;}div.inline{background-color: #ff9442; margin-right: 4px; float: left;}</style>");
    t.prepend(i);
    if(!ModernizrForSequence.svg&&!n){
        e(".sequence-preloader").prepend('<div class="preloading"><div class="circle inline"></div><div class="circle inline"></div><div class="circle inline"></div></div>');
        setInterval(function(){
            e(".sequence-preloader .circle").fadeToggle(500)
            },500)
        }else n||setInterval(function(){
        e(".sequence-preloader").fadeToggle(500)
        },500)
    },
_operaTest:function(){
    e("body").append('<span id="sequence-opera-test"></span>');
    var t=e("#sequence-opera-test");
    t.css("-o-transition","1s");
    if(t.css("-o-transition")!=="1s"){
        t.remove();
        return!1
        }
        t.remove();
    return!0
    }
};

var r={
    startingFrameID:1,
    cycle:!0,
    animateStartingFrameIn:!1,
    transitionThreshold:!1,
    reverseAnimationsWhenNavigatingBackwards:!0,
    preventDelayWhenReversingAnimations:!1,
    moveActiveFrameToTop:!0,
    autoPlay:!1,
    autoPlayDirection:1,
    autoPlayDelay:5e3,
    navigationSkip:!0,
    navigationSkipThreshold:250,
    fadeFrameWhenSkipped:!0,
    fadeFrameTime:150,
    preventReverseSkipping:!1,
    nextButton:!1,
    showNextButtonOnInit:!0,
    prevButton:!1,
    showPrevButtonOnInit:!0,
    pauseButton:!1,
    unpauseDelay:null,
    pauseOnHover:!0,
    pauseIcon:!1,
    showPauseButtonOnInit:!0,
    pagination:!1,
    showPaginationOnInit:!0,
    preloader:!1,
    preloadTheseFrames:[1],
    preloadTheseImages:[],
    hideFramesUntilPreloaded:!0,
    prependPreloadingComplete:!0,
    hidePreloaderUsingCSS:!0,
    hidePreloaderDelay:0,
    keyNavigation:!0,
    numericKeysGoToFrames:!0,
    keyEvents:{
        left:"prev",
        right:"next"
    },
    customKeyEvents:{},
    swipeNavigation:!0,
    swipeThreshold:20,
    swipePreventsDefault:!1,
    swipeEvents:{
        left:"prev",
        right:"next",
        up:!1,
        down:!1
        },
    hashTags:!1,
    hashDataAttribute:!1,
    hashChangesOnFirstFrame:!1,
    fallback:{
        theme:"slide",
        speed:500
    }
};

e.fn.sequence=function(t){
    return this.each(function(){
        e.data(this,"sequence")||e.data(this,"sequence",new n(e(this),t,r))
        })
    }
})(jQuery);