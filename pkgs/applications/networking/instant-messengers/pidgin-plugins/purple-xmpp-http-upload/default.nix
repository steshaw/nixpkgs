{ stdenv, fetchgit, pidgin, glib, libxml2 }:

stdenv.mkDerivation rec {
  name = "purple-xmpp-upload-${version}";
  version = "178096cbfc9df165c2dc1677666439969d212b37";

  src = fetchgit {
    url = "https://github.com/Junker/purple-xmpp-http-upload";
    rev = version;
    sha256 = "12l9rqlgb4i50xxrfnvwz9sqfk0d3c0m6l09mnvfixqi8illyvlp";
  };

  buildInputs = [ pidgin glib libxml2 ];

  installPhase = ''
    install -Dm644 -t $out/lib/purple-2 jabber_http_file_upload.so
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Junker/purple-xmpp-http-upload;
    description = "HTTP File Upload plugin for libpurple (XMPP Protocol XEP-0363)";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ emmanuelrosa ];
  };
}
