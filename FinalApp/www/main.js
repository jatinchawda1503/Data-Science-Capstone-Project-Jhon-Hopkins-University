function myFunction() {

                var btn = document.getElementById("myButton");

                if (btn.value == "1") {
                    btn.value = "Close Curtain";
                    btn.innerHTML = "Close Curtain";
                }
                else {
                    btn.value = "Open Curtain";
                    btn.innerHTML = "Open Curtain";
                }

            }