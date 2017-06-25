/*
 *  licurl-vala
 *  Vala bindings for libcurl
 *
 *  Copyright (C) 2016 Guillaume Benoit <guillaume@manjaro.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a get of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


[CCode (cheader_filename = "curl/curl.h")]
namespace Curl {
	[CCode (cprefix = "curl_")]
	public static Curl.Code global_init (long flags);
	public static void global_cleanup ();
	public static unowned string version ();

	[CCode (cname = "CURL", cprefix = "curl_easy_", free_function = "curl_easy_cleanup")]
	[Compact]
	public class Easy {
		[CCode (cname = "curl_easy_init")]
		public Easy();
		[PrintfFormat]
		public Curl.Code getinfo (Curl.Info info, ...);
		public Curl.Code easy_pause (int bitmask);
		public Curl.Code perform ();
		public void reset ();
		[PrintfFormat]
		public Curl.Code setopt (Curl.Option option, ...);
		public static unowned string strerror (Curl.Code errornum);
	}

	[CCode (cname = "CURLcode", cprefix = "CURLE_", has_type_id = false)]
	public enum Code {
		OK,
		UNSUPPORTED_PROTOCOL,
		FAILED_INIT,
		URL_MALFORMAT,
		NOT_BUILT_IN,
		COULDNT_RESOLVE_PROXY,
		COULDNT_RESOLVE_HOST,
		COULDNT_CONNECT,
		FTP_WEIRD_SERVER_REPLY,
		REMOTE_ACCESS_DENIED,
		FTP_WEIRD_PASS_REPLY,
		FTP_WEIRD_PASV_REPLY,
		FTP_WEIRD_227_FORMAT,
		FTP_CANT_GET_HOST,
		FTP_COULDNT_SET_TYPE,
		PARTIAL_FILE,
		FTP_COULDNT_RETR_FILE,
		QUOTE_ERROR,
		HTTP_RETURNED_ERROR,
		WRITE_ERROR,
		UPLOAD_FAILED,
		READ_ERROR,
		OUT_OF_MEMORY,
		OPERATION_TIMEDOUT,
		FTP_PORT_FAILED,
		FTP_COULDNT_USE_REST,
		RANGE_ERROR,
		HTTP_POST_ERROR,
		SSL_CONNECT_ERROR,
		BAD_DOWNLOAD_RESUME,
		FILE_COULDNT_READ_FILE,
		LDAP_CANNOT_BIND,
		LDAP_SEARCH_FAILED,
		FUNCTION_NOT_FOUND,
		ABORTED_BY_CALLBACK,
		BAD_FUNCTION_ARGUMENT,
		INTERFACE_FAILED,
		TOO_MANY_REDIRECTS,
		UNKNOWN_OPTION,
		TELNET_OPTION_SYNTAX,
		PEER_FAILED_VERIFICATION,
		GOT_NOTHING,
		SSL_ENGINE_NOTFOUND,
		SSL_ENGINE_SETFAILED,
		SEND_ERROR,
		RECV_ERROR,
		SSL_CERTPROBLEM,
		SSL_CIPHER,
		SSL_CACERT,
		BAD_CONTENT_ENCODING,
		LDAP_INVALID_URL,
		FILESIZE_EXCEEDED,
		USE_SSL_FAILED,
		SEND_FAIL_REWIND,
		SSL_ENGINE_INITFAILED,
		LOGIN_DENIED,
		TFTP_NOTFOUND,
		TFTP_PERM,
		REMOTE_DISK_FULL,
		TFTP_ILLEGAL,
		TFTP_UNKNOWNID,
		REMOTE_FILE_EXISTS,
		TFTP_NOSUCHUSER,
		CONV_FAILED,
		CONV_REQD,
		SSL_CACERT_BADFILE,
		REMOTE_FILE_NOT_FOUND,
		SSH,
		SSL_SHUTDOWN_FAILED,
		AGAIN,
		SSL_CRL_BADFILE,
		SSL_ISSUER_ERROR,
		FTP_PRET_FAILED,
		RTSP_CSEQ_ERROR,
		RTSP_SESSION_ERROR,
		FTP_BAD_FILE_LIST,
		CHUNK_FAILED
	}

	[CCode (cname = "CURLINFO", cprefix = "CURLINFO_", has_type_id = false)]
	public enum Info {
		NONE,
		EFFECTIVE_URL,
		RESPONSE_CODE,
		TOTAL_TIME,
		NAMELOOKUP_TIME,
		CONNECT_TIME,
		PRETRANSFER_TIME,
		SIZE_UPLOAD,
		SIZE_DOWNLOAD,
		SPEED_DOWNLOAD,
		SPEED_UPLOAD,
		HEADER_SIZE,
		REQUEST_SIZE,
		SSL_VERIFYRESULT,
		FILETIME,
		CONTENT_LENGTH_DOWNLOAD,
		CONTENT_LENGTH_UPLOAD,
		STARTTRANSFER_TIME,
		CONTENT_TYPE,
		REDIRECT_TIME,
		REDIRECT_COUNT,
		PRIVATE,
		HTTP_CONNECTCODE,
		HTTPAUTH_AVAIL,
		PROXYAUTH_AVAIL,
		OS_ERRNO,
		NUM_CONNECTS,
		SSL_ENGINES,
		COOKIELIST,
		LASTSOCKET,
		FTP_ENTRY_PATH,
		REDIRECT_URL,
		PRIMARY_IP,
		APPCONNECT_TIME,
		CERTINFO,
		CONDITION_UNMET,
		RTSP_SESSION_ID,
		RTSP_CLIENT_CSEQ,
		RTSP_SERVER_CSEQ,
		RTSP_CSEQ_RECV,
		PRIMARY_PORT,
		LOCAL_IP,
		LOCAL_PORT,
		LASTONE
	}

	[CCode (cname = "CURL_NETRC_OPTION", cprefix = "CURL_NETRC_", has_type_id = false)]
	public enum NetRCOption {
		IGNORED,
		OPTIONAL,
		REQUIRED,
		LAST
	}

	[CCode (cname = "CURLoption", cprefix = "CURLOPT_", has_type_id = false)]
	public enum Option {
		FILE,
		WRITEDATA,
		URL,
		PORT,
		PROXY,
		USERPWD,
		PROXYUSERPWD,
		RANGE,
		INFILE,
		READDATA,
		ERRORBUFFER,
		WRITEFUNCTION,
		READFUNCTION,
		TIMEOUT,
		INFILESIZE,
		POSTFIELDS,
		REFERER,
		FTPPORT,
		USERAGENT,
		LOW_SPEED_LIMIT,
		LOW_SPEED_TIME,
		RESUME_FROM,
		COOKIE,
		HTTPHEADER,
		RTSPHEADER,
		HTTPPOST,
		SSLCERT,
		KEYPASSWD,
		CRLF,
		QUOTE,
		WRITEHEADER,
		HEADERDATA,
		COOKIEFILE,
		SSLVERSION,
		TIMECONDITION,
		TIMEVALUE,
		CUSTOMREQUEST,
		STDERR,
		POSTQUOTE,
		WRITEINFO,
		VERBOSE,
		HEADER,
		NOPROGRESS,
		NOBODY,
		FAILONERROR,
		UPLOAD,
		POST,
		DIRLISTONLY,
		APPEND,
		NETRC,
		FOLLOWLOCATION,
		TRANSFERTEXT,
		PUT,
		XFERINFOFUNCTION,
		XFERINFODATA,
		AUTOREFERER,
		PROXYPORT,
		POSTFIELDSIZE,
		HTTPPROXYTUNNEL,
		INTERFACE,
		KRBLEVEL,
		SSL_VERIFYPEER,
		CAINFO,
		MAXREDIRS,
		FILETIME,
		TELNETOPTIONS,
		MAXCONNECTS,
		FRESH_CONNECT,
		FORBID_REUSE,
		RANDOM_FILE,
		EGDSOCKET,
		CONNECTTIMEOUT,
		HEADERFUNCTION,
		HTTPGET,
		SSL_VERIFYHOST,
		COOKIEJAR,
		SSL_CIPHER_LIST,
		HTTP_VERSION,
		FTP_USE_EPSV,
		SSLCERTTYPE,
		SSLKEY,
		SSLKEYTYPE,
		SSLENGINE,
		SSLENGINE_DEFAULT,
		DNS_CACHE_TIMEOUT,
		PREQUOTE,
		DEBUGFUNCTION,
		DEBUGDATA,
		COOKIESESSION,
		CAPATH,
		BUFFERSIZE,
		NOSIGNAL,
		SHARE,
		PROXYTYPE,
		ACCEPT_ENCODING,
		PRIVATE,
		HTTP200ALIASES,
		UNRESTRICTED_AUTH,
		FTP_USE_EPRT,
		HTTPAUTH,
		SSL_CTX_FUNCTION,
		SSL_CTX_DATA,
		FTP_CREATE_MISSING_DIRS,
		PROXYAUTH,
		FTP_RESPONSE_TIMEOUT,
		IPRESOLVE,
		MAXFILESIZE,
		INFILESIZE_LARGE,
		RESUME_FROM_LARGE,
		MAXFILESIZE_LARGE,
		NETRC_FILE,
		USE_SSL,
		POSTFIELDSIZE_LARGE,
		TCP_NODELAY,
		FTPSSLAUTH,
		IOCTLFUNCTION,
		IOCTLDATA,
		FTP_ACCOUNT,
		COOKIELIST,
		IGNORE_CONTENT_LENGTH,
		FTP_SKIP_PASV_IP,
		FTP_FILEMETHOD,
		LOCALPORT,
		LOCALPORTRANGE,
		CONNECT_ONLY,
		CONV_FROM_NETWORK_FUNCTION,
		CONV_TO_NETWORK_FUNCTION,
		CONV_FROM_UTF8_FUNCTION,
		MAX_SEND_SPEED_LARGE,
		MAX_RECV_SPEED_LARGE,
		FTP_ALTERNATIVE_TO_USER,
		SOCKOPTFUNCTION,
		SOCKOPTDATA,
		SSL_SESSIONID_CACHE,
		SSH_AUTH_TYPES,
		SSH_PUBLIC_KEYFILE,
		SSH_PRIVATE_KEYFILE,
		FTP_SSL_CCC,
		TIMEOUT_MS,
		CONNECTTIMEOUT_MS,
		HTTP_TRANSFER_DECODING,
		HTTP_CONTENT_DECODING,
		NEW_FILE_PERMS,
		NEW_DIRECTORY_PERMS,
		POSTREDIR,
		SSH_HOST_PUBLIC_KEY_MD5,
		OPENSOCKETFUNCTION,
		OPENSOCKETDATA,
		COPYPOSTFIELDS,
		PROXY_TRANSFER_MODE,
		SEEKFUNCTION,
		SEEKDATA,
		CRLFILE,
		ISSUERCERT,
		ADDRESS_SCOPE,
		CERTINFO,
		USERNAME,
		PASSWORD,
		PROXYUSERNAME,
		PROXYPASSWORD,
		NOPROXY,
		TFTP_BLKSIZE,
		SOCKS5_GSSAPI_SERVICE,
		SOCKS5_GSSAPI_NEC,
		PROTOCOLS,
		REDIR_PROTOCOLS,
		SSH_KNOWNHOSTS,
		SSH_KEYFUNCTION,
		SSH_KEYDATA,
		MAIL_FROM,
		MAIL_RCPT,
		FTP_USE_PRET,
		RTSP_REQUEST,
		RTSP_SESSION_ID,
		RTSP_STREAM_URI,
		RTSP_TRANSPORT,
		RTSP_CLIENT_CSEQ,
		RTSP_SERVER_CSEQ,
		INTERLEAVEDATA,
		INTERLEAVEFUNCTION,
		WILDCARDMATCH,
		CHUNK_BGN_FUNCTION,
		CHUNK_END_FUNCTION,
		FNMATCH_FUNCTION,
		CHUNK_DATA,
		FNMATCH_DATA,
		RESOLVE,
		TLSAUTH_USERNAME,
		TLSAUTH_PASSWORD,
		TLSAUTH_TYPE,
		TRANSFER_ENCODING,
		CLOSESOCKETFUNCTION,
		CLOSESOCKETDATA,
		LASTENTRY
	}

	[CCode (cname = "curl_TimeCond", cprefix = "CURL_TIMECOND_", has_type_id = false)]
	public enum TimeCond {
		NONE,
		IFMODSINCE,
		IFUNMODSINCE,
		LASTMOD,
		LAST
	}

	[CCode (cname = "curl_progress_callback", has_target = false)]
	public delegate int ProgressCallback (void* user_data, uint64 dltotal, uint64 dlnow, uint64 ultotal, uint64 ulnow);

	[CCode (cname = "CURLAUTH_ANY", cheader_filename = "curl/curl.h")]
	public const int CURLAUTH_ANY;

	[CCode (cname = "CURL_ERROR_SIZE")]
	public const int ERROR_SIZE;

	[CCode (cname = "CURL_GLOBAL_SSL")]
	public const int GLOBAL_SSL;

    [CCode (cname = "CURLSSH_AUTH_PASSWORD", cprefix = "CURL_")]
    public const int CURLSSH_AUTH_PASSWORD;

    [CCode (cname = "CURL_GLOBAL_ALL", cprefix = "CURL_")]
    public const int GLOBAL_ALL;
}
