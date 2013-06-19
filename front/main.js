chrome.devtools.panels.create(
	"Grinder",
	null,
	"grinder.html",
	function (panel) {
		var ws = new WebSocket('ws://localhost:8666');
		ws.onmessage = function (message) {
			alert 'message'
		}
	}
);
