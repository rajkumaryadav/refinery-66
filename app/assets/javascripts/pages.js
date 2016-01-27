//GET WINDOW SIZE
function getWidth() {
	return $(window).width();
}

//switch order of elements on main page
function swapBars() {
	var windowSize = getWidth();
	var barElement = $(".barSpace").children(".row");
	if (windowSize < 768) {
		$(".footerSideMenu").prependTo(barElement);
	} else {
		$(".footerInquiry").prependTo(barElement);
	}
}

//SCROLL ON CLICK
function clickScroll(where,pos,speed,ease) {
	var indexpos = jQuery(where).offset().top;
	$('html, body').stop().animate({
		scrollTop: indexpos-pos
	}, { "duration": speed, "easing": ease});
};

//position the secondary menu
function alignSecondMenu() {
	if ( $(".secondaryContainer").length > 0) {
		var checkMenu = $(".secondaryContainer").attr('class').replace("row secondaryContainer ","");
		if (checkMenu == "noSecondMenu") {
			return;
		} else { 
			setTimeout(function(){
				var getLocation = $(".headerMenu").find('[href="/'+checkMenu+'"]').position().left;
				$(".firstLevelMenu, .secondLevelMenu").css("left",getLocation);
				$(".secondaryMenu ."+checkMenu).fadeIn();
				if ( $(".secondaryContainer."+checkMenu).attr("data-extra") == "menu" ) {
					$(".secondLevelMenu").fadeIn();
				}
			}, 500);	
		}
	}
};

//set the height of main slideshow to be window height
function mainContent() {
	$(".mainContent").css("height", $(window).height());
}

//slide down inquiry form
function closeInquiry() {
	if ($(".secondaryFooter .inquiryTitle").hasClass("activeInquiry")) {
		$(".secondaryFooter .inquiryTitle").removeClass("activeInquiry");
		/* for internet explorer */
		if (isIE) {
			$(".footerInquiry").animate({
				height: "80px"
			}, 500);
		} else {
			$(".footerInquiry").css("height","80px");
		}
	}
}

function closeMobileMenu() {
	if ( $(".headerMenuMobile").hasClass("activeMobile") ) {
		$(".headerMenuMobile").removeClass("activeMobile");
		if (isIE) {
			$(".mainHeader, .headerMenu").animate({
				height: "45px"
			},500);
			$("header").not(".secondaryHeader").animate({
				height: "45px"
			},500);
			$(".noSecondMenu").animate({
				marginTop: "52px"
			},500);
		} else {
			$(".mainHeader, .headerMenu").css("height","45px");
			$("header").not(".secondaryHeader").css("height","45px");
			$(".noSecondMenu").css("margin-top","52px");
		}
	}
}

//WINDOW RESIZE
$(window).resize(function(){
	var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);
	var winWidth = getWidth();
	alignSecondMenu();
	swapBars();
	var selection = $(".secondaryContentSlide.current").index();
	closeInquiry();
	if (!isMobile) {
		closeMobileMenu();
	}
	
});

$(window).bind('orientationchange', function(event) {
  mainContent();
});

//DOCUMENT READY
$(document).ready(function() { 

	var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);
	var isIphone = /iPhone|iPod/i.test(navigator.userAgent);
	var isSafari = navigator.userAgent.indexOf("Safari")!=-1 && navigator.userAgent.indexOf("Chrome")==-1;
	var winWidth = getWidth();

	//walkscore loader
	new ajaxLoader(".walkScore");
	$("#ws-walkscore-tile iframe").load(function() {
		$(".ajax_overlay").fadeOut();
	});

	//calculate main page content height
	if(isMobile) {
		mainContent();
	}
	
	//safari on iphone bottom bar fix
	if (isIphone && isSafari) {
		var browserRatio = $(window).width()/$(window).height();
		if (browserRatio < 1.5) {//alert("iphone4");
	    	$(".mainContent").css("margin-bottom","-63px");
	    }
	}

	//swap sections for main page
	swapBars();

	setTimeout(function() {
		//buildPager();
		$(".galleryPager").css("opacity","1");
	}, 500);
	setTimeout(function() {
		$(".gallerySlideLeft, .gallerySlideRight").fadeIn();
	}, 1000);

	//pagers for slideshows
	$(".galleryPagerWrap").on("click", "li", function() {
		$('.gallerySlideWrap').cycle( $(this).index() );
	});

	//building page slideshow stuff
	setTimeout(function() {
		$(".secondarySlideLeft, .secondarySlideRight").fadeIn().css("bottom", $(".secondaryCaption").outerHeight(true) );
		$(".secondaryCaption").css("opacity","1");
	},1000);
	$(".secondLevelMenu li").on("click", function() {
	    
		$(".secondLevelMenu .active").remove();
		$(this).append('<span class="active"></span>');
		var selection = $(this).index();
		var getName = $(this).data("name");
		$('.secondLevelSlide').cycle(selection+1);
		setTimeout(function() {
			$("."+getName+" .secondaryImgWrap").cycle("reinit");
		},250);
		if ( $(window).width() < 768) {
			setTimeout(function() {
				$(".secondLevelSlide").css("height", $(".secondaryContentSlide.cycle-slide-active").height() );
			}, 1100);
		}
	});

	//count secondary page slideshow items
	var howManySlides = $(".sIWItem").length;
	if (howManySlides < 2) {
		$(".secondarySlideLeft, .secondarySlideRight").css("display","none");
	}

	//scroll down page on inquiry click
	$(".barSpace .inquiryTitle").click(function() {
		clickScroll(".inquiryTitle",0,1000,"easeInOutExpo");
	});

	//hover images over blue bars
	if (!isMobile) {
		$(".blueBar").mouseover(function() {
			$(this).children('img').css("opacity", "1");
		}).mouseout(function() {
			$(this).children('img').css("opacity", "0");
		});
	}
	
	//click event on blue bars
	var barWrapHeight = $(".barWrap").height();
	var barBlueHeight = $(".blueBar").height();
	var barHiddenHeight = barWrapHeight - barBlueHeight;
	$(".blueBar").click(function() { 
		var $this = $(this);
		var whichOne = $(this).index();
		var howHigh = 0;
		if (whichOne == 0) {
			howHigh = "0px";
		} else if (whichOne == 1) {
			howHigh = "71px";
		} else if (whichOne == 2) {
			howHigh = "142px";
		} else if (whichOne == 3) {
			howHigh = "213px";
		}
		if ( $this.hasClass("selectBar") ) {
			$this.removeClass("selectBar");
			$this.children("img").removeClass('barImage');
			setTimeout(function() { $($this).css("z-index","1"); }, 500);			
			/* for internet explorer */
			if (isIE) {
				$this.animate({
					top: howHigh
				},500);
				$this.children(".barHidden").animate({
					height: "0px"
				}, 500);
			} else {
				$this.css("top",howHigh);
				$this.children(".barHidden").css("height","0");
			}
		} else {
			$this.addClass("selectBar");
			$this.css("z-index","10");
			$this.children("img").addClass('barImage');
			/* for internet explorer */
			if (isIE) {
				$this.animate({
					top: "0px"
				},500);
				$this.children(".barHidden").animate({
					top: barBlueHeight,
					height: barHiddenHeight+1
				}, 500);
			} else {
				$this.css("top","0px");
				$this.children(".barHidden").css("top",barBlueHeight).css("height",barHiddenHeight+1);
			}
		}
	});

	//form action
	//$("form input[type='submit']").click(function() {
	//	alert("Send form function");
	//	closeInquiry();
	//	return false;
	//});

	//position secondary menu
	alignSecondMenu();

	//secondary footer inquiry
	$(".secondaryFooter .inquiryTitle").click(function() {
		if ($(this).hasClass("activeInquiry")) {
			$(this).removeClass("activeInquiry");
			/* for internet explorer */
			if (isIE) {
				$(".footerInquiry").animate({
					height: "80px"
				}, 500);
			} else {
				$(".footerInquiry").css("height","80px");
			}
		} else {
			$(this).addClass("activeInquiry");
			/* for internet explorer */
			if (isIE) {
				$(".footerInquiry").animate({
					height: "479px"
				}, 500);
			} else {
				$(".footerInquiry").css("height","479px");
			}
		}
	});

	//mobile menu click
	$(".headerMenuMobile").click(function() {
		if ( $(this).hasClass("activeMobile") ) {
			$(this).removeClass("activeMobile");
			if (isIE) {
				$(".mainHeader, .headerMenu").animate({
					height: "45px"
				},500);
				$("header").not(".secondaryHeader").animate({
					height: "45px"
				},500);
				$(".noSecondMenu").animate({
					marginTop: "52px"
				},500);
			} else {
				$(".mainHeader, .headerMenu").css("height","45px");
				$("header").not(".secondaryHeader").css("height","45px");
				$(".noSecondMenu").css("margin-top","52px");
			}
		} else {
			$(this).addClass("activeMobile");
			if (isIE) {
				$(".mainHeader, .headerMenu").animate({
					height: "300px"
				},500);
				$("header").not(".secondaryHeader").animate({
					height: "300px"
				},500);
				$(".noSecondMenu").animate({
					marginTop: "-13px"
				},500);
			} else {
				$(".mainHeader, .headerMenu").css("height","300px");
				$("header").not(".secondaryHeader").css("height","300px");
				$(".noSecondMenu").css("margin-top","-13px");
			}
		}
	});

	//media section video show
	$(".mediaText .showVideo").click(function() {
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
			//$(".mediaOther .video").css("height","0px");
			$(".mediaOther .video").css("padding-top","0%");
		} else {
			$(this).addClass("active");
			//$(".mediaOther .video").css("height","400px");
			$(".mediaOther .video").css("padding-top","50%");
		}
	});

	


});