package com.tdi.millbots;

public class IRCBot extends org.jibble.pircbot.PircBot {
    private org.aitools.programd.Core core;
    private final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(IRCBot.class);
    private String id;
    java.util.Random rng = new java.util.Random(System.currentTimeMillis());

    /**
     * @param n
     * @param c 
     * @param id 
     */
    public IRCBot(String n, org.aitools.programd.Core c, String id) {
        this.core = c;
        this.id = id;
        this.setName(n);
    }

    @Override
    protected void onMessage(String channel, String sender, String login, String hostname, String message) {
        // Be sure the Core is ready.
        while (this.core.getStatus() != org.aitools.programd.Core.Status.READY) {
            this.logger.warn("waiting for Core.");
            try { Thread.sleep(3600); }
            catch (InterruptedException e) { System.err.println(e.getMessage()); }
        }
        String[] response = org.aitools.programd.util.XMLKit.filterViaHTMLTags(this.core.getResponse(message, sender, this.id));
        if (response.length > 0) {
          String response1 = response[rng.nextInt(response.length)];
          if (!response1.isEmpty()) {
            sendMessage(channel, "@"+sender+": "+org.aitools.programd.util.XMLKit.filterWhitespace(response1));
          }
        }
    }

    /**
     * Logs PircBot messages to our logger, instead of just dumping them to stdout.
     * Unfortunately we don't know whether the message is just info or is an error.
     * 
     * @see org.jibble.pircbot.PircBot#log(java.lang.String)
     */
    @Override
    public void log(String line)
    {
        this.logger.info(line);
    }
}
