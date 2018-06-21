function more(a,b) { 
	var ar = [];
	a.forEach(function (c){
		if (c>b){
			ar.push(c);
		}
	});
	return ar;
}
function less(a,b) { 
	var ar = []; 
	a.forEach(function (c){
		if (c<b){
			ar.push(c);
		}   
	}); 
	return ar; 
}
function equal(a,b) { 
	var ar = []; 
	a.forEach(function (c){
		if (c==b){
			ar.push(c);
		}   
	}); 
	return ar; 
}
function qsort(a) {
	if(a==[]){
		return [];
	}else{
		return (qsort(less(a,a[0])).concat(equal(a,a[0]))).concat(qsort(more(a,a[0])))
	}
}
console.log(qsort([3,2,1]));//RangeError: Maximum call stack size exceeded :)
