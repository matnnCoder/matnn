(function () {
    'use strict';

    var startTime = Date.now();

    function formatDuration(ms) {
        var seconds = Math.floor(ms / 1000);
        var hours = Math.floor(seconds / 3600);
        var minutes = Math.floor((seconds % 3600) / 60);
        var secs = seconds % 60;

        function pad(n) {
            return n < 10 ? '0' + n : '' + n;
        }

        return pad(hours) + ':' + pad(minutes) + ':' + pad(secs);
    }

    function formatTime(date) {
        function pad(n) {
            return n < 10 ? '0' + n : '' + n;
        }
        return pad(date.getHours()) + ':' + pad(date.getMinutes()) + ':' + pad(date.getSeconds());
    }

    function updateClock() {
        var clockEl = document.getElementById('clock');
        var uptimeEl = document.getElementById('uptime');

        if (clockEl) {
            clockEl.textContent = formatTime(new Date());
        }

        if (uptimeEl) {
            uptimeEl.textContent = formatDuration(Date.now() - startTime);
        }
    }

    updateClock();
    setInterval(updateClock, 1000);

    console.log('%c[Matnn] %c欢迎使用 Matnn 静态文件服务！', 'color:#6a82fb;font-weight:bold;', 'color:#333;');
    console.log('[Matnn] 服务器已就绪，静态资源已加载完成。');
})();
