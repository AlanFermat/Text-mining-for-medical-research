SELECT  *
 Into [Test].[dbo].[health_vc_00_16]
 from [Test].[dbo].[00_03_health];

INSERT INTO [Test].[dbo].[health_vc_00_16]  
 SELECT *
 FROM [Test].[dbo].[04_07_health];


INSERT INTO [Test].[dbo].[health_vc_00_16]  
 SELECT *
 FROM [Test].[dbo].[08_11_health];

 
INSERT INTO [Test].[dbo].[health_vc_00_16]  
 SELECT *
 FROM [Test].[dbo].[12_16_health];


select a.*, [Exit Type]
      ,[Time to Exit (Years)]
      ,[Date Announced / Filed]
      ,[Date Completed / Issued]
      ,[Ticker]
      ,[Proceeds Amt + Overallot Sold All Markets (USD Mil)]
      ,[Acquiror Name]
      ,[Rank Value Incl# Net Debt (USD Mil)]
 into [Test].[dbo].[health_vc_00_16_join]
 from [Test].[dbo].[health_vc_00_16] a
 LEFT JOIN [Test].[dbo].[exit_health] b
 on a.[Company Name]=b.[Company Name];

 select * from [Test].[dbo].[health_vc_00_16_join]

 
 select a.[Company MSA],b.[Firm State / Region] as [Company State / Region]
  from [Test].[dbo].[health_vc_00_16_join] a
 LEFT JOIN [Test].[dbo].[health_vc_00_16_join] b
 on a.[Company MSA]=b.[Firm MSA]
 group by a.[Company MSA],b.[Firm State / Region]

 select a.*, b.[Company State / Region]
 into [Test].[dbo].[health_vc_00_16_join3]
 from [Test].[dbo].[health_vc_00_16_join] a
 left join [Test].[dbo].[comp_health] b
 on a.[Company Name] = b.[Company Name]

select [Company State / Region], count(*)
from 
(
select [Company Name], [Company MSA], [Company State / Region]
from [Test].[dbo].[health_vc_00_16_join3]
group by [Company Name], [Company MSA], [Company State / Region] 
)
group by [Company State / Region]


select [Company Name], [Company MSA], [Company State / Region], [Exit Type]
into [Test].[dbo].[health_dist_comp]
from [Test].[dbo].[health_vc_00_16_join3]
group by [Company Name], [Company MSA], [Company State / Region], [Exit Type]

select lower([Company State / Region]) as region, count(*) as num_comps
from [Test].[dbo].[health_dist_comp]
group by [Company State / Region]
order by num_comps DESC

select [Company MSA] as region, count(*) as num_comps
from [Test].[dbo].[health_dist_comp]
group by [Company MSA]
order by num_comps DESC

	


 select * from [Test].[dbo].[health_vc_00_16_join3]


 drop table [Test].[dbo].[nih2]