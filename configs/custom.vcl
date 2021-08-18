vcl 4.1;
backend default {
    .host = "[backend]:8000";
}
acl wl {
    "localhost";
    "127.0.0.1";
    "::1";
}

sub vcl_recv {
    if (req.url ~ "^/$" || req.url ~ "^/debug$") {
        return (pass);
    }
    if (req.url ~ "^/flag$") {
        if (client.ip ~ wl) {
            return (pass);
        }
        else {
            return (synth(403));
        }
    }
    else {
        return (synth(404));
    }
}
