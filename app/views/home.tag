<home>
    <style>
        .home{ min-height: 100%; width: 100%; padding-bottom: 55px; }
        .home .mask-box{margin:0 auto;background:#fff;z-index:1;position:relative;text-align:center;height:300px;margin-top:-150px;top:50%; padding-top: 48px;}
        .home .mask-box h2{ text-align: center; font-size: 20px; border-bottom: 1px #e1e1e1 solid; padding: 0 0 10px; }
        .home .mask-box .content{ line-height: 1.231; padding: 10px 0; text-align: left; text-indent: 28px; }
        .home .close{ width: 48px; height: 48px; padding: 16px; position: absolute; right: 0; top: 0; }
        .home .close img{ width: 100%; }
        .home-group{ background: transparent; padding: 5%;}
        .home-group .item{ padding: 10px 0; border-bottom: 1px #e1e1e1 solid;}
        .home-group .item .title{ padding: 0 0 10px; font-size: 20px; }
    </style>
    <section class="home">
        <navigation title="首页" parent="home"></navigation>
        <div class="empty" if="{ !!isLoading }">
            <img src="http://cdn.nzaom.com/home/notice.png?t=1" alt="" />
            <div class="tips">你造么，程序员GG打了个盹</div>
            <p><a href="/">刷新下试试~</a></p>
        </div>
        <section class="home-group" if="{ !isLoading }">
            <div class="item">
                <div class="title">n-button</div>
                <n-button title="按钮文案" clazz="btn btn-black"></n-button>
            </div>
            <div class="item">
                 <div class="title">n-tips</div>
                  <n-button title="click me!show tips!" clazz="btn btn-gray-border" id="tipBtn"></n-button>
                  <n-tips></n-tips>
            </div>
            <div class="item">
                 <div class="title">n-tips</div>
                 <n-button title="click me!show confrim!" clazz="btn btn-blue" id="confirmBtn"></n-button>
                 <n-confirm></n-confirm>
            </div>
            <div class="item">
                 <div class="title">n-mask</div>
                 <n-button title="click me!show mask!" clazz="btn btn-gray" id="maskBtn"></n-button>
            </div>
            <div class="item">
                 <div class="title">n-row</div>
                 <n-row container='.home'>
                    <div>this is your "<span>row</span>" content</div>
                    <div>好了，英文不好就不装了，n-row的作用就是阻止HTML内容的转义</div>
                 </n-row>
            </div>
        </section>
         <n-mask container='.home' show_mask="{!!showMask}" dismiss="{dismiss}">
            <section class="mask-box">
                 <div class="close" onclick="{ parent.dismiss }">
                    <img src="http://cdn.nzaom.com/detail/close.png" alt="你造么" />
                </div>
                <h2>this is the title</h2>
                <div class="content">
                    this is the content
                </div>
            </section>
         </n-mask>
    </section>
    <bottom-menu controller="home"></bottom-menu>
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
            $(".home").on("click","#tipBtn",function(){
                notification.tips.show("this is your tip content",3000)//3000ms disappear times
            });
            $(".home").on("click","#confirmBtn",function(){
                notification.confirm.show("confirm?",function(){
                    notification.tips.show("yes",3000)
                    notification.confirm.hide()
                })
            });
            $(".home").on("click","#maskBtn",function(){
                self.doShowMask()
            });
        }
        doShowMask(){
            this.showMask=true
            this.update()
        }
        dismiss(){
            this.showMask=false;
            this.update()
        }
    </script>
</home>
