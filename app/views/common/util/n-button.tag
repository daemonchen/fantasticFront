<n-button>
    <style>
        .btn{
            display: block;
            background: #212121;
            width: 100%;
            color: #FFFFFF;
            border: none;
            height: 38px;
            line-height: 38px;
            text-align: center;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.5s;
            -moz-transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -o-transition: all 0.5s;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }
        .btn.btn-black{
            background: #212121;
        }
        .btn.btn-black:hover{
            background-color: #64d2f1;
        }
        .btn.btn-blue{ background-color: #64d2f1; }
        .btn.btn-gray{
            background: #e3e3e3;
            color: #212121;
        }
        .btn.btn-gray:hover{
            background-color: #64d2f1;
        }

        .btn.btn-gray-border{
            background: #fff;
            color: #212121;
            border: 2px solid #e1e1e1;
        }
        .btn.btn-gray-border:hover{
            border: 2px solid #212121;
        }
    </style>
    <div class="{opts.clazz}">
        {opts.title}
    </div>
</n-button>