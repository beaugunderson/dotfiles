#!/opt/homebrew/bin/python3

import errno
import os
import shutil

from subprocess import check_output

import arrow

IGNORE_FILES = [
    ".DS_Store",
    ".idata",
    ".localized",
    ".rdata",
    ".reloc",
    ".rsrc",
    ".rsrc_1",
    ".tls",
    "By week",
    "This week",
    "Last week",
]


def mkdirp(path):
    try:
        os.makedirs(path)
    except OSError as e:
        if e.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def date_added(filename):
    added_string = check_output(
        [
            "mdls",
            "-raw",
            "-nullMarker",
            '""',
            "-name",
            "kMDItemDateAdded",
            filename,
        ],
        universal_newlines=True,
    )

    try:
        return arrow.get(added_string, "YYYY-MM-DD HH:mm:ss Z")
    except arrow.parser.ParserMatchError as e:
        # print(f'Skipped {filename}: {e}')
        pass


def format_week(week):
    year, week, _ = week.isocalendar()

    return ("By week", "{}-{:02d}".format(year, week))


def link_week(downloads, week, title):
    week_path = os.path.join(downloads, *format_week(week))

    if not os.path.exists(week_path):
        mkdirp(week_path)

    link_path = os.path.join(downloads, title)

    if os.path.islink(link_path):
        os.unlink(link_path)

    os.symlink(week_path, link_path)


def sort_downloads():
    downloads = os.path.expanduser("~/Downloads")

    os.chdir(downloads)

    link_week(downloads, arrow.now(), "This week")
    link_week(downloads, arrow.now().shift(weeks=-1), "Last week")

    one_day_ago = arrow.now().shift(days=-1)

    for filename in os.listdir(downloads):
        if filename in IGNORE_FILES:
            continue

        file_date = date_added(filename)

        # print(file_date, filename)

        if not file_date:
            # print("no file_date for", filename)
            continue

        if file_date > one_day_ago:
            continue

        destination = os.path.join(downloads, *format_week(file_date))

        if not os.path.exists(destination):
            mkdirp(destination)

        if os.path.exists(os.path.join(destination, filename)):
            # print(f'Skipping "{filename}" because it already exists')
            continue

        shutil.move(os.path.join(downloads, filename), destination)


if __name__ == "__main__":
    sort_downloads()
