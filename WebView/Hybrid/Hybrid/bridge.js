// 현재 호출한 디바이스가 어떤 것인지 체크합니다.
var isMobile = {
    Android: function () {
        return navigator.userAgent.match(/Android/i) == null ? false : true;
    },
    iOS: function () {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i) == null ? false : true;
    },
    any: function () {
        return (isMobile.Android() || isMobile.iOS());
    }
};

// 입력 된 링크를 전달하는 Bridge 함수
function outLink(link) {
    if (isMobile.any()) {
        if (isMobile.Android()) {
            android.bridge.outLink(link);
        } else if (isMobile.iOS()) {
            webkit.messageHandlers.outLink.postMessage(link);
        }
    }
}	

// Back Button 클릭 Bridge 함수
function back() {
    if (isMobile.any()) {
        if (isMobile.Android()) {
            android.bridge.back(true);
        } else if (isMobile.iOS()) {
            webkit.messageHandlers.back.postMessage(true);
        }
    }
}

function complete() {
    return "Ok"
}
