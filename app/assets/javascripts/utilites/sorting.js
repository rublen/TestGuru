document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title');
  if (control) {
    control.addEventListener('click', sortRowsByTitle);
  };
});

function sortRowsByTitle() {
  var table = document.querySelector('table');
  var rows = table.querySelectorAll('tr'); // Nodelist
  var sortedRows = [];

  //select all table rows except the first one (header)
  for(var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  };

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    this.querySelector('.octicon-arrow-up').classList.remove('hide');
    this.querySelector('.octicon-arrow-down').classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    this.querySelector('.octicon-arrow-down').classList.remove('hide');
    this.querySelector('.octicon-arrow-up').classList.add('hide');
  };

  // create and fill new html-table
  var sortedTable = document.createElement('table');
  sortedTable.classList.add('table', 'table-hover');

  var thead = document.createElement('thead');
  thead.classList.add('thead-light');

  thead.appendChild(rows[0]);
  sortedTable.appendChild(thead);

  for(var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]);
  };

  table.parentNode.replaceChild(sortedTable, table);
};

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelectorAll('td')[1].textContent;
  var testTitle2 = row2.querySelectorAll('td')[1].textContent;

  if(testTitle1 < testTitle2) { return -1 };
  if(testTitle1 > testTitle2) { return 1 };
  return 0;
};

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelectorAll('td')[1].textContent;
  var testTitle2 = row2.querySelectorAll('td')[1].textContent;

  if(testTitle1 < testTitle2) { return 1 };
  if(testTitle1 > testTitle2) { return -1 };
  return 0;
};
