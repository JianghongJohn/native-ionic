cordova.define("cr.encke.phonedialer.PhoneDialer", function(require, exports, module) {

	var exec = require('cordova/exec');
	
	var phonedialer = function( phnum )	{
		if( device.platform == "iOS" )	{
  	  		exec( null, null, "PhoneDialer", "dialPhone", [phnum] );
		}	else	{
			window.open( ( "tel:" + phnum ), "_system" );
		}
	};
	
	module.exports = phonedialer;

});
