addClass

.$.ajax({
		url: '/path/to/file',
		type: 'default GET (Other values: POST)',
		dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
		data: {param1: 'value1'},}
			 )
${7:.done(function() {
		console.log("success");
})}
${8:.fail(function() {
		console.log("error");
})}
${9:.always(function() {
		console.log("complete");
})};


