/**
 * 
 */
	function includeHTML() {
		var z, i, ele, file, xhttp;
		z = document.getElementsByTagName("*");
		for (i = 0; i < z.length; i++) {
			ele = z[i];
			file = ele.getAttribute("nav.html");
			if (file) {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						ele.innerHTML = this.responseText;
						ele.removeAttribute("nav.html");
						includeHTML();
					}
				}
				xhttp.open("GET", file, true);
				xhttp.send();
				return;
			}
		}
	}