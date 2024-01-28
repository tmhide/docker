FROM amazon/aws-lambda-ruby:3.2 as build
RUN yum install -y unzip && \
    curl -Lo "/tmp/chromedriver.zip" "https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip" && \
    curl -Lo "/tmp/chrome-linux.zip" "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F1217362%2Fchrome-linux.zip?generation=1698717835110888&alt=media" && \
    unzip /tmp/chromedriver.zip -d /opt/ && \
    unzip /tmp/chrome-linux.zip -d /opt/


FROM amazon/aws-lambda-ruby:3.2
RUN yum install atk cups-libs gtk3 libXcomposite alsa-lib \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel -y

# COPY --from=build /opt/chrome-linux /opt/chrome
# COPY --from=build /opt/chromedriver /opt/
COPY --from=build /opt/chrome-linux /usr/local/chrome
COPY --from=build /opt/chromedriver /usr/local/
COPY app.rb ${LAMBDA_TASK_ROOT}
COPY Gemfile ${LAMBDA_TASK_ROOT}

ENV GEM_HOME=${LAMBDA_TASK_ROOT}
RUN bundle install
CMD [ "app.LambdaFunction::Handler.process" ]