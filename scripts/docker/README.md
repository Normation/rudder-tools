# Rudder server Dockerfile

This is a proof of concept of a Dockerfile that sets up a Rudder server in 5.0.

What is missing:

* `VOLUME` configuration
* Proper service start (which will make it compatible with post-5.0 versions)
* Improving the size of the resulting container (apt cache clean, etc.)

