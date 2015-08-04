<navigation>
    <style>
        .navigation{width:100%;height:48px;background:#fff;color:#212121;font-size:15px;line-height:48px; position: relative; border-bottom: 1px #e1e1e1 solid; }
        .navigation .back-btn{ height: 48px; width: 48px; text-align: center; cursor: pointer; z-index: 11; position: absolute; left: 0; top: 0; }
        .navigation .back-btn img{height:42px;margin-right:0; margin-top:3px; position:relative; float: left; display: block; }
        .navigation .back-btn span{ float: left; display: block; }
        .navigation .title{ text-align: center; position: absolute; left: 0; top: 0; width: 100%; height: 100%; font-size: 18px; z-index: 0; }
    </style>
        <div class="navigation clearfix">
            <div class="back-btn" onclick="{ pop }">
                <img src="http://cdn.nzaom.com/navigation/arrow.png?t=1"/>
            </div>
            <div class="title">{opts.title}</div>
            <yield/>
        </div>
    <script>
        var navigation = require('../../js/common/navigation.js')
        this.on('mount update', function() {
            navigation.init()
        })
        pop(){
            navigation.pop(opts.parent)
        }
    </script>
</navigation>