# find-redirects
Simple script to read domains and paths from txt files and find where they
redirect to.  Probalby not very useful outside of the specific task I had to
write it for.


# Usage

    $ ./find-redirects.sh


# Example Output

    $ ./find-redirects.sh
    200: www.cnn.com/
    301: www.cnn.com/tech -> http://www.cnn.com/TECH
    301: www.cnn.com/TECH -> http://www.cnn.com/TECH/
    200: www.cnn.com/TECH/

Yes... `/tech` 301s to `/TECH` which 301s to `/TECH/`


# Files
**domains.txt**: A list of domains, one per line

**paths.txt**: A list of paths to test on each domain, one per line

**find-redirects.sh**: The executable shell script
