FROM psitrax/psitransfer:v2.1.1

# @TODO: Load env file based on arg env.

COPY ./.branding ./.branding
COPY ./branding ./.branding/branding

USER root
RUN ["sh", "./.branding/brander.sh"]
USER node
