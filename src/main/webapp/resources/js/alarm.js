toastr.options.escapeHtml = true;
toastr.options.closeButton = true;
toastr.options.newestOnTop = false;
toastr.options.progressBar = true;

//let ws = new SockJS("/codelit/stomp");
let ws = new SockJS(`${getContextPath()}/stomp`);
// 메시지-컨피그 통해서 stomp로 웹소켓 연결

let stompClient = Stomp.over(ws);

stompClient.connect({}, (frame) => {
	
	stompClient.subscribe("/topic/user", (frame) => {
		const msgObj = JSON.parse(frame.body);
		const {msgTitle, msgContent} = msgObj;
		toastr.info(msgContent, "[전체알림] "+msgTitle, {timeOut: 5000});
	});
	
	stompClient.subscribe("/topic/reject/{memberId}", (frame) => {
		const msgObj = JSON.parse(frame.body);
		const {msgTitle, msgContent} = msgObj;
		toastr.error(msgContent, "[신청 반려]"+msgTitle, {timeOut: 5000});
	});

	stompClient.subscribe("/topic/success/{memberId}", (frame) => {
		const msgObj = JSON.parse(frame.body);
		const {msgTitle, msgContent} = msgObj;
		toastr.success(msgContent, "[신청 승인]"+msgTitle, {timeOut: 5000});
	});
	
});

	function sendMessage(url){
	const $title = $("#msgTitle");
	const $message = $("#msgContent");
	
	const message = {
		msgTitle : $title.val(),
		msgContent : $message.val(),
		readYN : 'N'
	};
	
	stompClient.send(url, {}, JSON.stringify(message));
	
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}