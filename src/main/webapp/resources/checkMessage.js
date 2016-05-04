$(function(){
		$.ajax({
			type : "POST"
			, url : "/javatree/member/checkNotification.action"
			, dataType : 'json'
			, success : function(response){
				$('.list-notification').html('');
				if(response.notificationList != null){
					$(".itemnew").hide();
					var notificationList = response.notificationList;
					$('.count-value').text(notificationList.length);
					if(notificationList.length != 0){
						$(".itemnew").show();
						notificationList.forEach(function(notification){
							var author = $('.author');
							var li = $('<li class="ac-new"></li>');
							li.html('<a href="/javatree/qna/qnaDetail.action?notificationCheck=true&questionno='+notification.questionno+'&notificationno='+notification.notificationno+'"><div class="list-body"><div class="author"><span>'+notification.senderid+
									'</span><div class="div-x"></div></div><p>'+notification.message+'</p><div class="time"><span>'+notification.regdate+'</span></div></div></a>').appendTo(".list-notification");
						});
					}
				}
			}
			, error : function(response){
				console.log('실패');
			}
		});
	
		setInterval(function(){
			$.ajax({
				type : "POST"
				, url : "/javatree/member/checkNotification.action"
				, dataType : 'json'
				, success : function(response){
					$('.list-notification').html('');
					if(response.notificationList != null){
						var notificationList = response.notificationList;
						if(notificationList.length == 0){
							$(".itemnew").hide();
						}else{
							$(".itemnew").show();
							notificationList.forEach(function(notification){
								var author = $('.author');
								var li = $('<li class="ac-new"></li>');
								li.html('<a href="/javatree/qna/qnaDetail.action?notificationCheck=true&questionno='+notification.questionno+'&notificationno='+notification.notificationno+'"><div class="list-body"><div class="author"><span>'+notification.senderid+
										'</span><div class="div-x"></div></div><p>'+notification.message+'</p><div class="time"><span>'+notification.regdate+'</span></div></div></a>').appendTo(".list-notification");
							});
						}
					}
				}
				, error : function(response){
					console.log('실패');
				}
			});
		}, 5000)
		
	});