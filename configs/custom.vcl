vcl 4.1;
backend default {
    .host = "[backend]:8000";
}
sub vcl_recv {
    if (req.url ~ "^/flag") {
        return (synth(403));
    }
}