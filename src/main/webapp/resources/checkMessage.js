$(function(){
		setInterval(function(){
			$.ajax({
				type : "POST"
				, url : "/javatree/member/checkNotification.action"
				, dataType : 'json'
				, success : function(response){
					$('.list-notification').html('');
					if(response.notificationList != null){
						var notificationList = response.notificationList;
						notificationList.forEach(function(notification){
							var author = $('.author');
							var li = $('<li class="ac-new"></li>');
							li.html('<a href="/javatree/qna/qnaDetail.action?notification=true&questionno='+notification.questionno+'"><div class="list-body"><div class="author"><span>'+notification.senderid+
									'</span><div class="div-x"></div></div><p>'+notification.message+'</p><div class="time"><span>'+notification.regdate+'</span></div></div></a>').appendTo(".list-notification");
						});
					}
				}
				, error : function(response){
					console.log('실패');
				}
			});
		}, 5000)
		
	});