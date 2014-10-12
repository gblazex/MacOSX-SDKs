/*
     File:       AEDataModel.r
 
     Contains:   AppleEvent Data Model Interfaces.
 
     Version:    AppleEvents-242~1
 
     Copyright:  � 1996-2002 by Apple Computer, Inc., all rights reserved
 
     Bugs?:      For bug reports, consult the following page on
                 the World Wide Web:
 
                     http://developer.apple.com/bugreporter/
 
*/

#ifndef __AEDATAMODEL_R__
#define __AEDATAMODEL_R__

#ifndef __CORESERVICES_R__
#include <CoreServices/CoreServices.r>
#endif

/* Apple event descriptor types */
#define typeBoolean 					'bool'
#define typeChar 						'TEXT'

/* Preferred numeric Apple event descriptor types */
#define typeSInt16 						'shor'
#define typeSInt32 						'long'
#define typeUInt32 						'magn'
#define typeSInt64 						'comp'
#define typeIEEE32BitFloatingPoint 		'sing'
#define typeIEEE64BitFloatingPoint 		'doub'
#define type128BitFloatingPoint 		'ldbl'
#define typeDecimalStruct 				'decm'

/* Non-preferred Apple event descriptor types */
#define typeSMInt 						'shor'
#define typeShortInteger 				'shor'
#define typeInteger 					'long'
#define typeLongInteger 				'long'
#define typeMagnitude 					'magn'
#define typeComp 						'comp'
#define typeSMFloat 					'sing'
#define typeShortFloat 					'sing'
#define typeFloat 						'doub'
#define typeLongFloat 					'doub'
#define typeExtended 					'exte'

/* More Apple event descriptor types */
#define typeAEList 						'list'
#define typeAERecord 					'reco'
#define typeAppleEvent 					'aevt'
#define typeEventRecord 				'evrc'
#define typeTrue 						'true'
#define typeFalse 						'fals'
#define typeAlias 						'alis'
#define typeEnumerated 					'enum'
#define typeType 						'type'
#define typeAppParameters 				'appa'
#define typeProperty 					'prop'
#define typeFSS 						'fss '
#define typeFSRef 						'fsrf'
#define typeFileURL 					'furl'
#define typeKeyword 					'keyw'
#define typeSectionH 					'sect'
#define typeWildCard 					'****'
#define typeApplSignature 				'sign'
#define typeQDRectangle 				'qdrt'
#define typeFixed 						'fixd'
#define typeProcessSerialNumber 		'psn '
#define typeApplicationURL 				'aprl'
#define typeNull 						'null'				/*  null or nonexistent data  */

/* New addressing modes for MacOS X */
#define typeKernelProcessID 			'kpid'
#define typeMachPort 					'port'

/* Keywords for Apple event attributes */
#define keyTransactionIDAttr 			'tran'
#define keyReturnIDAttr 				'rtid'
#define keyEventClassAttr 				'evcl'
#define keyEventIDAttr 					'evid'
#define keyAddressAttr 					'addr'
#define keyOptionalKeywordAttr 			'optk'
#define keyTimeoutAttr 					'timo'
#define keyInteractLevelAttr 			'inte'				/*  this attribute is read only - will be set in AESend  */
#define keyEventSourceAttr 				'esrc'				/*  this attribute is read only - returned as typeShortInteger  */
#define keyMissedKeywordAttr 			'miss'				/*  this attribute is read only  */
#define keyOriginalAddressAttr 			'from'				/*  new in 1.0.1  */
#define keyAcceptTimeoutAttr 			'actm'				/*  new for Mac OS X  */

/* These bits are specified in the keyXMLDebuggingAttr (an SInt32) */
#define kAEDebugPOSTHeader 				0x01				/*  headers of the HTTP post we sent - typeChar  */
#define kAEDebugReplyHeader 			0x02				/*  headers returned by the server  */
#define kAEDebugXMLRequest 				0x04				/*  the XML request we sent  */
#define kAEDebugXMLResponse 			0x08				/*  the XML reply from the server  */
#define kAEDebugXMLDebugAll 			0xFFFFFFFF			/*  everything!  */

/* These values can be added as a parameter to the direct object of a
   SOAP message to specify the serialization schema.  If not
   specified, kSOAP1999Schema is the default. These should be added as
   typeType. */
#define kSOAP1999Schema 				'ss99'
#define kSOAP2001Schema 				'ss01'

															/*  outgoing event attributes  */
#define keyUserNameAttr 				'unam'
#define keyUserPasswordAttr 			'pass'				/*  not sent with the event  */
#define keyDisableAuthenticationAttr 	'auth'				/*  When present and with a non zero value (that is, false, or integer 0),  */
															/*  AESend will not authenticate the user.  If not present, or with a non-zero */
															/*  value, AESend will prompt for authentication information from the user if the interaction level allows.  */
#define keyXMLDebuggingAttr 			'xdbg'				/*  a bitfield of specifying which XML debugging data is to be returned with the event  */
															/*  Event class / id  */
#define kAERPCClass 					'rpc '				/*  for outgoing XML events  */
#define kAEXMLRPCScheme 				'RPC2'				/*  event ID: event should be sent to an XMLRPC endpoint  */
#define kAESOAPScheme 					'SOAP'				/*  event ID: event should be sent to a SOAP endpoint  */
#define kAESharedScriptHandler 			'wscp'				/*  event ID: handler for incoming XML requests  */
															/*  these parameters exist as part of the direct object of the event for both incoming and outgoing requests  */
#define keyRPCMethodName 				'meth'				/*  name of the method to call  */
#define keyRPCMethodParam 				'parm'				/*  the list (or structure) of parameters  */
#define keyRPCMethodParamOrder 			'/ord'				/*  if a structure, the order of parameters (a list)  */
															/*  when keyXMLDebugginAttr so specifies, these additional parameters will be part of the reply.  */
#define keyAEPOSTHeaderData 			'phed'				/*  what we sent to the server  */
#define keyAEReplyHeaderData 			'rhed'				/*  what the server sent to us  */
#define keyAEXMLRequestData 			'xreq'				/*  what we sent to the server  */
#define keyAEXMLReplyData 				'xrep'				/*  what the server sent to us  */
															/*  additional parameters that can be specified in the direct object of the event  */
#define keyAdditionalHTTPHeaders 		'ahed'				/*  list of additional HTTP headers (a list of 2 element lists)  */
#define keySOAPAction 					'sact'				/*  the SOAPAction header (required for SOAP messages)  */
#define keySOAPMethodNameSpace 			'mspc'				/*  Optional namespace (defaults to m:)  */
#define keySOAPMethodNameSpaceURI 		'mspu'				/*  Required namespace URI  */
#define keySOAPSchemaVersion 			'ssch'				/*  Optional XML Schema version, defaults to kSOAP1999Schama  */

/* 
   When serializing AERecords as SOAP structures, it is possible
   to specify the namespace and type of the structure.  To do this,
   add a keySOAPStructureMetaData record to the top level of the
   record to be serialized.  If present, this will be used to specify
   the structure namespace.  This will produce a structure elment that
   looks like:

    <myStruct
        xmlns:myNamespace="http://myUri.org/xsd",
        xsi:type="myNamespace:MyStructType">
        ...
    </myStruct>

*/
#define keySOAPStructureMetaData 		'/smd'
#define keySOAPSMDNamespace 			'ssns'				/*  "myNamespace" */
#define keySOAPSMDNamespaceURI 			'ssnu'				/*  "http://myUri.org/xsd" */
#define keySOAPSMDType 					'sstp'				/*  "MyStructType" */

/* 
 * Web Services Proxy support.  Available only on systems > 10.1.x.
 * These constants should be added as attributes on the event that is
 * being sent (not part of the direct object.)
 */
															/*  Automatically configure the proxy based on System Configuration  */
#define kAEUseHTTPProxyAttr 			'xupr'				/*  a typeBoolean.  Defaults to true. */
															/*  manually specify the proxy host and port.  */
#define kAEHTTPProxyPortAttr 			'xhtp'				/*  a typeSInt32 */
#define kAEHTTPProxyHostAttr 			'xhth'				/*  a typeChar */

/*
 * Web Services SOCKS support.  kAEUseSocksAttr is a boolean that
 * specifies whether to automatically configure SOCKS proxies by
 * querying System Configuration.
 */
#define kAESocks4Protocol 				4
#define kAESocks5Protocol 				5

#define kAEUseSocksAttr 				'xscs'				/*  a typeBoolean.  Defaults to true. */
															/*  This attribute specifies a specific SOCKS protocol to be used  */
#define kAESocksProxyAttr 				'xsok'				/*  a typeSInt32 */
															/*  if version >= 4  */
#define kAESocksHostAttr 				'xshs'				/*  a typeChar */
#define kAESocksPortAttr 				'xshp'				/*  a typeSInt32 */
#define kAESocksUserAttr 				'xshu'				/*  a typeChar */
															/*  if version >= 5  */
#define kAESocksPasswordAttr 			'xshw'				/*  a typeChar */

#define kAENormalPriority 				0x00000000			/*  post message at the end of the event queue  */
#define kAEHighPriority 				0x00000001			/*  post message at the front of the event queue (same as nAttnMsg)  */

#define kAENoReply 						0x00000001			/*  sender doesn't want a reply to event  */
#define kAEQueueReply 					0x00000002			/*  sender wants a reply but won't wait  */
#define kAEWaitReply 					0x00000003			/*  sender wants a reply and will wait  */
#define kAEDontReconnect 				0x00000080			/*  don't reconnect if there is a sessClosedErr from PPCToolbox  */
#define kAEWantReceipt 					0x00000200			/*  (nReturnReceipt) sender wants a receipt of message  */
#define kAENeverInteract 				0x00000010			/*  server should not interact with user  */
#define kAECanInteract 					0x00000020			/*  server may try to interact with user  */
#define kAEAlwaysInteract 				0x00000030			/*  server should always interact with user where appropriate  */
#define kAECanSwitchLayer 				0x00000040			/*  interaction may switch layer  */
#define kAEDontRecord 					0x00001000			/*  don't record this event - available only in vers 1.0.1 and greater  */
#define kAEDontExecute 					0x00002000			/*  don't send the event for recording - available only in vers 1.0.1 and greater  */
#define kAEProcessNonReplyEvents 		0x00008000			/*  allow processing of non-reply events while awaiting synchronous AppleEvent reply  */


#endif /* __AEDATAMODEL_R__ */
