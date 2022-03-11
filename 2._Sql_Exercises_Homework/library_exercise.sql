Kevin Williams
DAT21I TECH SPRING 2022

DATABASES
Library
					MySQL SQL Exercises



1 Show the members under the name "Jens S." who were born before 1970 that became members of the library in 2013.

Select * FROM tmember
WHERE cName = 'Jens S.'
AND dBirth < '1970-01-01'
AND dNewMember >= 2013-01-01;

2 Show those books that have not been published by the publishing companies with ID 15 and 32, except if they were
published before 2000.

SELECT * FROM tbook
WHERE nPublishingCompanyID != 15
AND nPublishingCompanyID != 32 || tbook.nPublishingYear < 2000;

3 Show the name and surname of the members who have a phone number, but no address.

SELECT cName,
       cSurname,
       cPhoneNo,
       cAddress
FROM tmember
WHERE cAddress IS NULL;

4 Show the authors with surname "Byatt" whose name starts by an "A" (uppercase) and contains an "S" (uppercase).;

SELECT * FROM tauthor
WHERE cSurname = 'Byatt';

5 Show the number of books published in 2007 by the publishing company with ID 32.

SELECT * FROM tbook
WHERE nPublishingYear BETWEEN '2007-01-01' AND '2007-12-31'
AND nPublishingCompanyID = 32;


6 For each day of the year 2014, show the number of books loaned by the member with CPR "0305393207"

SELECT a.cName,
       a.cSurname,
       b.cCPR,
       b.dLoan,
       c.cTitle
FROM ((tmember AS a
    INNER JOIN tloan AS b ON b.cCPR = a.cCPR)
         INNER JOIN tbook AS c)
WHERE a.cCPR = '0305393207'
AND b.dLoan BETWEEN '2014-01-01' AND '2014-12-31';

7 Modify the previous clause so that only those days where the member was loaned more than one book appear.

SELECT a.cName,
       a.cSurname,
       b.cCPR,
       b.dLoan,
       c.cTitle
FROM ((tmember AS a
    INNER JOIN tloan AS b ON b.cCPR = a.cCPR)
         INNER JOIN tbook AS c)
WHERE a.cCPR = '0305393207'
AND b.dLoan BETWEEN '2014-01-01' AND '2014-12-31';

8 Show all library members from the newest to the oldest. Those who became members on the same day will be sorted
alphabetically (by surname and name) within that day.

SELECT cName,
cSurname,
dNewMember
FROM tmember
WHERE dNewMember ORDER BY dNewMember,
cName;

9 Show the title of all books published by the publishing company with ID 32 along with their theme or themes.

SELECT tbook.cTitle, ttheme.cName FROM ((tbook
INNER JOIN tbooktheme ON tbook.nBookID = tbooktheme.nBookID)
INNER JOIN ttheme ON ttheme.nThemeID = tbooktheme.nThemeID)
WHERE tbook.nPublishingCompanyID = 32;

10 Show the name and surname of every author along with the number of books authored by them, but only for authors who
have registered books on the database.

SELECT a.cName,
a.cSurname
FROM tauthor AS a
INNER JOIN tauthorship ON tauthorship.nAuthorID = a.nAuthorID
INNER JOIN tbook ON tauthorship.nBookID = tbook.nBookID;


11 Show the name and surname of all the authors with published books along with the lowest publishing year for their
books.

SELECT cName, cSurname, MIN(nPublishingYear) FROM ((tauthor
INNER JOIN tauthorship ON tauthorship.nAuthorID = tauthor.nAuthorID)
INNER JOIN tbook ON tbook.nBookID = tauthorship.nBookID)
GROUP BY cName, cSurname;

12 For each signature and loan date, show the title of the corresponding books and the name and surname of the member
who had them loaned.

SELECT tloan.cSignature AS book_signature,
    tloan.dLoan AS loan_date,
    tbook.cTitle AS book_title,
    tmember.cName, tmember.cSurname FROM ((tloan
    INNER JOIN tbookcopy ON tloan.cSignature = tbookcopy.cSignature)
    INNER JOIN tmember ON tloan.cCPR = tmember.cCPR)
    INNER JOIN tbook ON tbook.nBookID = tbookcopy.nBookID;


13 Repeat exercises 9 to 12 using the modern JOIN notation.

SEE # 9
SEE # 10
SEE # 11

14 Show all theme names along with the titles of their associated books. All themes must appear (even if there are no
books for some particular themes). Sort by theme name.

SELECT a.cName AS THEMES,
       c.cTitle AS TITLES
FROM ttheme a
INNER JOIN tbooktheme b
ON a.nThemeID = b.nThemeID
JOIN tbook c
ON b.nBookID = c.nBookID
ORDER BY a.cName;

15 Show the name and surname of all members who joined the library in 2013 along with the title of the books they took
on loan during that same year. All members must be shown, even if they did not take any book on loan during 2013.
Sort by member surname and name.

SELECT cName, cSurname, cTitle
FROM tmember, tbook, tbookcopy, tloan
WHERE tbook.nBookID = tbookcopy.nBookID
AND tbookcopy.cSignature = tloan.cSignature
AND tloan.cCPR = tmember.cCPR
AND dNewMember BETWEEN '2013-01-01' AND '2013-12-31'
AND dLoan BETWEEN '2013-01-01' AND '2013-12-31';

SELECT cm.cName,
       cm.cSurname,
       cm.dNewMember,
       cl.dloan,
       cb.cTitle
FROM tmember AS cm
         JOIN tloan AS cl
         JOIN tbook AS cb
            ON cl.cCPR & cm.cCPR = cb.cTitle
WHERE cm.dNewMember >= 2013-01-01 || cm.dNewMember
ORDER BY cm.cname & cm.cSurname;

16 Show the name and surname of all authors along with their nationality or nationalities and the titles of their books.
Every author must be shown, even though s/he has no registered books. Sort by author name and surname.

SELECT tauthor.cName, tauthor.cSurname, tcountry.cName, if(tauthor.nAuthorID <> tauthorship.nBookID, tbook.cTitle, '')
AS TITLE
FROM tauthor
INNER JOIN tnationality ON tauthor.nAuthorID = tnationality.nAuthorID
INNER JOIN tcountry ON tnationality.nCountryID = tcountry.nCountryID
INNER JOIN tbook ON tauthorship.nBookID = tbook.nBookID
ORDER BY  tauthor.cName, cSurname;


17 Show the title of those books which have had different editions published in both 1970 and 1989.

SELECT book1.cTitle AS 'Books with releases in 1970 and 1989'
FROM tbook book1, tbook book2
WHERE book1.cTitle = book2.cTitle AND book1.nPublishingYear = 1970
AND book2.nPublishingYear = 1989;

18 Show the surname and name of all members who joined the library in December 2013 followed by the surname and name of
those authors whose name is “William”.

SELECT a.cName,
        cSurname
FROM tmember AS a
WHERE dNewMember BETWEEN '2013-01-01' AND '2013-12-31';
SELECT b.cName,
       b.cSurname
FROM tauthor AS b
WHERE b.cName = 'William';


19 Show the name and surname of the first chronological member of the library using subqueries.

SELECT cName, cSurname
FROM tmember
ORDER BY dNewMember
ASC LIMIT 1;

20 For each publishing year, show the number of book titles published by publishing companies from countries that
constitute the nationality for at least three authors. Use subqueries.

SELECT a.cTitle,
a.nPublishingCompanyID,
b.nCountryID,
c.cName,
c.cSurname
FROM tbook AS a
INNER JOIN tnationality AS b ON b.nCountryID = a.nPublishingCompanyID
INNER JOIN tauthor AS c ON c.nAuthorID = b.nAuthorID;


21 Show the name and country of all publishing companies with the headings "Name" and "Country".

SELECT tcountry.cNameAS Country,
       tpublishingcompany.cName AS Name
FROM tcountry, tpublishingcompany
WHERE tpublishingcompany.nCountryID = tcountry.nCountryID;

22 Show the titles of the books published between 1926 and 1978 that were not published by the publishing company with
ID 32.

SELECT * FROM tbook
WHERE nPublishingYear BETWEEN 1926 AND 1978
AND nPublishingCompanyID != 32;

23 Show the name and surname of the members who joined the library after 2016 and have no address.

SELECT cName,
cSurname,
dNewMember,
cAddress
FROM tmember
WHERE dNewMember > 2016-01-01
AND cAddress IS NULL ;


24 Show the country codes for countries with publishing companies. Exclude repeated values.

SELECT DISTINCT a.nCountryID,
                b.cName
FROM tpublishingcompany AS a
INNER JOIN tcountry AS b ON b.nCountryID = a.nCountryID;



25 Show the titles of books whose title starts by "The Tale" and that are not published by "Lynch Inc".

SELECT a.cTitle,
a.nPublishingCompanyID,
b.cName
FROM tbook AS a
INNER JOIN tpublishingcompany AS b ON b.nPublishingCompanyID = a.nPublishingCompanyID
WHERE cTitle LIKE 'The Tale %'
AND cName != 'Lynch Inc';


26 Show the list of themes for which the publishing company "Lynch Inc" has published books, excluding repeated values.
SELECT DISTINCT a.cName,
b.cName
FROM ttheme AS a
INNER JOIN tpublishingcompany AS b
INNER JOIN tbooktheme ON tbooktheme.nThemeID = a.nThemeID
WHERE b.cName = 'Lynch Inc';

27 Show the titles of those books which have never been loaned.

SELECT cTitle
FROM tbook
INNER JOIN tmember
INNER JOIN tloan ON tloan.cCPR != tmember.cCPR
INNER JOIN tbookcopy ON tbookcopy.cSignature != tloan.cSignature;



SELECT DISTINCT cTitle
FROM tbook
WHERE nBookID NOT IN (SELECT nBookID FROM tbookcopy
WHERE cSignature IN(SELECT cSignature FROM tloan WHERE tloan.cSignature IS NOT NULL));


28 For each publishing company, show its number of existing books under the heading "No. of Books".

SELECT DISTINCT a.cName,
b.cTitle AS 'No. of Books'
FROM tpublishingcompany AS a
INNER JOIN tbook AS b ON a.nPublishingCompanyID = b.nPublishingCompanyID;
#NOT SURE OF SOLUTION, INCOMPLETE


29 Show the number of members who took some book on a loan during 2013.;

SELECT a.cName,
       a.cSurname
FROM tmember AS a
         INNER JOIN tloan ON a.cCPR = tloan.cCPR
WHERE tloan.dLoan BETWEEN '2013-01-01' AND '2013-12-31';

30 For each book that has at least two authors, show its title and number of authors under the heading "No. of Authors".

#INCOMPLETE
SELECT a.cTitle,
COUNT(b.cName) AS 'No. of Authors'
    FROM tauthor AS b
    LEFT JOIN tbook AS a ON a.nBookID = b.nAuthorID
    GROUP BY b.cName;

