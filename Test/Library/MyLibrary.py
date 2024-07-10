from urllib.parse import urlparse


def extract_path_segment(url_string):
    parsed_url = urlparse(url_string)
    path_segments = parsed_url.path.split('/')
    return path_segments[2] if len(path_segments) > 2 else ""