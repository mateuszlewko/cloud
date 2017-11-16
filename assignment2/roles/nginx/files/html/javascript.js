nextImage = () => {
        var len = 3;
        var num = Math.round(Math.random() * 3);
        var path = 'static/img' + num.toString() + '.jpg';

        document.getElementById('img').setAttribute('src', path);
    }