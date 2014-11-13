$(function() {
		var context = $('#context').val();
		
		var today = new Date();
		
		$('#scheduledOn').datepicker({
			language: 'zh-CN',
			autoclose: true,
			todayHighlight: true,
			startDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 3)
		});
		
		$('#resetBtn').click(function() {
			$('.has-error').removeClass('has-error');
		});
		
		$('#submitBtn').click(function() {
			validateForm();
			
			if ($('.has-error').length === 0) {
			    var mail = {
				    sendFrom: $('#sendFrom').val(),
				    sendTo: $('#sendTo').val(),
				    scheduledOn: $('#scheduledOn').val(),
				    message: $('#message').val()
				};
			    
				$.ajax({
			        url: context + '/createAction',
			        type: 'POST',
			        async: false,
			        contentType: 'application/json',
			        data: JSON.stringify(mail),
			        success: function(data, text, xhr) {
			        	var date = new Date(data.scheduledOn);
			        	var message = '感谢您使用时光慢邮！您的慢邮件正在发送中，将于 ';
			        	message += date.getFullYear() + '年' + (date.getMonth() + 1) + '月' + date.getDate() + '日';
			        	message += ' 送达到 ' + data.sendTo;
			        	
			        	$('#modalMessage').text(message);
						$('#modalSucess').modal('show');
						
						$('#resetBtn').click();
			        },
			        error: function(a, b, c) {
			            alert(c);
			        }
			    });
			}
		});

	    
	});

	function validateForm() {
		if($('#sendFrom').val().trim() === '') {
			$('.sendFrom').addClass('has-error');
		} else {
			$('.sendFrom').removeClass('has-error');
		}
		var reg = /\w+[@]{1}\w+[.]\w+/;
		if(reg.test($('#sendTo').val()) === false) {
			$('.sendTo').addClass('has-error');
		} else {
			$('.sendTo').removeClass('has-error');
		}
		if($('#scheduledOn').val().trim() === '') {
			$('.scheduledOn').addClass('has-error');
		} else {
			$('.scheduledOn').removeClass('has-error');
		}
		if($('#message').val().trim() === '') {
			$('.message').addClass('has-error');
		} else {
			$('.message').removeClass('has-error');
		}
	}