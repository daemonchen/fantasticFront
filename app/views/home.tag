<home>
    <style>
    </style>
    <section class="home">
        <div class="headband"></div>
        <n-header></n-header>

        <main id="main" class="main">
            <div class="main-inner">
                <div id="content" class="content">
                    {% block content %}{% endblock %}
                </div>

                {% if (theme.duoshuo_hotartical and page.title) %}
                    <!-- 多说热评文章-->
                    <p>热评文章</p>
                    <div class="ds-top-threads" data-range="weekly" data-num-items="4"></div>
                {% endif %}

                {% if page.comments %}
                  <div class="comments" id="comments">
                    {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
                      <div class="ds-thread" data-thread-key="{{ page.path }}"
                           data-title="{{ page.title }}" data-url="{{ page.permalink }}">
                      </div>
                    {% elseif config.disqus_shortname %}
                      <div id="disqus_thread">
                        <noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                      </div>
                    {% endif %}
                  </div>
                {% endif %}
            </div>

            {% block sidebar %}{% endblock %}
        </main>

        <n-footer></n-footer>
    </section>
    <script>
        var self = this
        var jsloader = require('../js/common/jsloader.js')
        var notification = require('../js/common/notification.js')
        var navigation = require('../js/common/navigation.js')
        var auth = require('../js/common/auth.js')
        var INTERFACE = require('../js/common/interface.js')
        var DB = require('../js/common/store.js')
        this.on('mount',function(){
            self.eventBind()
        })
        eventBind(){
        }
    </script>
</home>
