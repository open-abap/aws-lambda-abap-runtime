const transpiler = require('./../transpiler');

async function start_runtime() {
	const handlerClassString = await transpiler.transpile(process.env._HANDLER, process.env.sourcecode);
	const requireString = "const abap = require('@abaplint/runtime');\n";
	const event = process.env.event;
	const evalString = 'new (' + handlerClassString + ')().run(' + event + ')';
	const response = eval(requireString + evalString);
	console.log(response);
}

start_runtime();
