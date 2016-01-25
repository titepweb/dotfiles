
## PROJECT MANAGEMENT SKILL

#### INTRODUCTION

##### Phan biet knowledge va skill

Knowledge co dac diem : 1. dung luong lon, 2. it su dung hang ngay. dan toi, kien thuc de bi mai mot, kho quan li (quan tri tri thuc: organize de ko quen, khi can access duoc ngay, khi add them ko bi roi)

Skill co dac diem : 1. format la workflow (step-by-step) duoi dang thuat toan (kich ban), 2. su dung khi user roi vao truong hop cu the. dan toi, user tao lap duoc thoi quen --> rat lau quen.

Loi ich cua knowledge : overview tot --> tu duy phan bien, sang tao, ... cang nhieu cang am tuong
Loi ich cua skill : ra duoc ket qua cu the, cang lam cang thuan thuc va dieu luyen.
==> am tuong + dieu luyen = uyen tham.

##### About the way of blogging
1. Ideas stored in markdown format, which is easier to write and read than html is and is more efficient than docx is because .md encourage users to focus on the content instead of how to make text appears as much fancy as they can. LaTeX can be used instead of markdown, especially for scientific purpose. 
2. github, fortunately, supports .md. Therefore, we can access our notes along with related files from anywhere. An anonymous account may be private enough.

##### Xuat phat tu bai toan can ban
Cat mong tay co don gian? Khi nay len y tuong cat mong tay, co le ban se...
1. Di tim do bam mong tay, neu mat thi ...
2. Cat mong tay, neu chay mau thi ...
3. Cat do bam mong tay vao cho cu (ra quyet dinh - cang thang - cat cho nao?)
4. Do/quet phan mong tay roi ra, neu ko se ...

Nhu vay, viec cat mong tay khong he don gian va co nhung rui ro, nay sinh nhung problems moi. Neu khong quan tri cuoc song tot, nhung dieu ngoai y muon thuong chi phoi den cam xuc, hieu qua cong viec hang ngay cua ta. Ket luan: phai quan tri cuoc song ca nhan va cong viec theo mot khuan mau (vd, modular) va cach thuc nao do. 

##### Nhung yeu cau cua quan tri du an
1. Resumability : Khi dong goi du an, mot thoi gian sau co the tiep tuc de dang (easy loading)
2. Cooperation : Nguoi khac (con, de tu, dong nghiep, ...) co the gop suc phat trien de dang, ko phai hoi nhieu ve project. It ra, nguoi khac cung co the hieu so luoc de su dung.
3. Backup and Recovery
4. Version control : Track changes to fix bugs when they occur ... Show statistic data and graph to illustrate developement of project.

##### Learn to use git
COMPUTER A
1. create an git account
2. install git
	1. git clone <REPO_URI> 
	2. git init (create a local repo)
3. make some changes
4. git add . (tough .gitignore if necessary)
5. git commit -m "commit_message"
6. git push origin master
Loop 3-->6

COMPUTER B - client
1. install git
2. git clone <REPO_URI>
<...time goes by>
3. git pull

**BRANCH & MERGE**

**SUBMODULE**
ADDING
cd to local repo
1. git submodule add <URI> <path> , for example zsh
2. git add . && git commit -m "Submodule added" --> commit for new folder and .gitsubmodule file.
3. git push origin master
<...> 
USING: After git clone <URI>, submodule content are not load
1. git submodule init
2. git submodule update --> clone submodule content
UPDATE SUBMODULE
1. cd <submodule_folder>
2. git checkout master
3. git pull

**Reference**
1. [ragerdudler's guide to use git](http://rogerdudler.github.io/git-guide/) 
2. [arnklint's Git Submodule Guide](http://arnklint.com/technology/git-submodules.html)

