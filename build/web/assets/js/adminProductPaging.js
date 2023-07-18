let thisPage = 1;
let limit = 3;
let list = document.querySelectorAll('.admin-product-list .admin-product-list_item');

function loadItem() {
  let beginGet = limit * (thisPage - 1);
  let endGet = limit * thisPage - 1;
  list.forEach((item, key) => {
    if (key >= beginGet && key <= endGet) {
      item.style.display = 'table-row'; // Changed 'block' to 'table-row'
    } else {
      item.style.display = 'none';
    }
  });
  listPage();
}

loadItem();

function listPage() {
  let count = Math.ceil(list.length / limit);
  let paginationContainer = document.querySelector('.home-product__pagination');
  paginationContainer.innerHTML = '';

  if (thisPage != 1) {
    let prev = document.createElement('li');
    prev.className = 'pagination-item';
    let i = document.createElement('i');
    i.className = 'pagination-item__icon fas fa-angle-left';
    let a = document.createElement('a');
    a.className = 'pagination-item__link';
    a.appendChild(i);
    prev.appendChild(a);
    prev.setAttribute('onclick', 'changePage(' + (thisPage - 1) + ')');
    paginationContainer.appendChild(prev);
  }
  
  for (let i = 1; i <= count; i++) {
    let newPage = document.createElement('li');
    let a = document.createElement('a');
    a.className = 'pagination-item__link';
    a.innerText = i;
    newPage.classList.add('pagination-item');
    newPage.appendChild(a);
    newPage.setAttribute('onclick', 'changePage(' + i + ')');
    paginationContainer.appendChild(newPage);
  }
  
  if (thisPage != count) {
    let next = document.createElement('li');
    next.className = 'pagination-item';
    let i = document.createElement('i');
    i.className = 'pagination-item__icon fas fa-angle-right';
    let a = document.createElement('a');
    a.className = 'pagination-item__link';
    a.appendChild(i);
    next.appendChild(a);
    next.setAttribute('onclick', 'changePage(' + (thisPage + 1) + ')');
    paginationContainer.appendChild(next);
  }
}

function changePage(i) {
  thisPage = i;
  loadItem();
}
