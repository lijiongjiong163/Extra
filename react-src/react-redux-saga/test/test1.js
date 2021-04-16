function a(){
    const haha=1;
    console.log(this);
}

a['Match']=1;
console.log(a['Match']);
a()