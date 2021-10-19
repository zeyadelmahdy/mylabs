#!/usr/bin/env python
# coding: utf-8

# In[103]:


import pandas as pd
import numpy as np


# In[104]:


get_ipython().run_line_magic('ls', '')


# In[105]:


get_ipython().run_line_magic('Github', '')


# In[ ]:


get_ipython().run_line_magic('cd', 'GitHub')


# In[ ]:


get_ipython().run_line_magic('cd', 'Documents/GitHub/Customer Analysis Lab')


# In[ ]:


get_ipython().run_line_magic('ls', '')


# In[ ]:


file1=pd.read_excel('file1 (2).xlsx',engine='openpyxl')


# In[ ]:


file1.head()


# In[ ]:


file2=pd.read_excel('file2 (2).xlsx',engine='openpyxl')


# In[ ]:


file3=pd.read_excel('file3 (1).xlsx',engine='openpyxl')


# In[ ]:


file1.shape
file2.shape
file3.shape


# In[ ]:


file1.shape


# In[ ]:


file2.shape


# In[ ]:


file3.shape


# In[ ]:


headers=file1.columns


# In[ ]:


headers


# In[ ]:


newheaders=pd.DataFrame(columns=headers)


# In[ ]:


newheaders


# In[ ]:


file3.head()


# In[ ]:





# In[ ]:


newfile2=file2[file2.columns[[0,1,2,3,4,5,6,7,9,10,8]]]


# In[ ]:


newfile3=file3[file3.columns[[0,1,4,3,2,5,6,7,8,10,9]]]


# In[ ]:


newfile3.head()


# In[ ]:


newfile2.head()


# In[ ]:


mergedfiles = pd.concat([headers,file1,newfile2,newfile3],axis=0)


# In[ ]:


file1.head()


# In[ ]:


newfile2.head()


# In[ ]:


newfile3.head()


# In[ ]:


mergedfiles = pd.concat([newheaders,file1,newfile2,newfile3],axis=0)


# In[ ]:


mergedfiles.head()


# In[106]:


mergedfiles.shape


# In[107]:


mergedfiles.dtypes


# In[108]:


newheaders


# In[109]:


mergedfiles = pd.concat([newheaders,file1,newfile2,newfile3],axis=0)


# In[110]:


mergedfiles


# In[111]:


file1.rename({'ST':'State','GENDER':'Gender'},axis=1)


# In[138]:


newfile2=file2.rename({'ST':'State','GENDER':'Gender'},axis=1)


# In[113]:


headers=file1.columns


# In[114]:


newheaders=pd.DataFrame(columns=headers)


# In[115]:


newfile2=file2[file2.columns[[0,1,2,3,4,5,6,7,9,10,8]]]


# In[116]:


newfile3=file3[file3.columns[[0,1,4,3,2,5,6,7,8,10,9]]]


# In[117]:


mergedfiles=pd.concat([newheaders,file1,newfile2,newfile3],axis=1)


# In[118]:


newheaders


# In[122]:


file1=file1.rename({'ST':'State','GENDER':'Gender'},axis=1)


# In[125]:


newheaders=file1.columns


# In[126]:


newheaders


# 
# mergedfiles = pd.concat([file1,newfile2,newfile3],axis=0)

# In[140]:


mergedfiles


# In[144]:


mergedfiles


# In[145]:


mergedfiles.dtypes


# In[150]:


mergedfiles1 = mergedfiles.drop(['Education','Number of Open Complaints'],axis=1)


# In[148]:





# In[152]:


mergedfiles1


# In[153]:


mergedfiles.info()


# In[154]:


mergedfiles['Customer Lifetime Value'] = mergedfiles['Customer Lifetime Value']*100


# In[155]:


mergedfiles['Customer Lifetime Value']


# In[156]:


mergedfiles


# In[157]:


mergedfiles['Customer Lifetime Value']=pd.to_numeric(mergedfiles['Customer Lifetime Value'],errors='coerce')


# In[158]:


mergedfiles


# In[159]:


mergedfiles1


# In[160]:


mergedfiles1['Customer Lifetime Value']=pd.to_numeric(mergedfiles1['Customer Lifetime Value'],errors='coerce')


# In[161]:


mergedfiles1


# In[167]:


mergedfiles1.info()


# In[170]:


#finding duplicates
duplicates= pd.DataFrame(mergedfiles1, columns=['Customer', 'State', 'Customer Lifetime Value','Total Claim Amount'])


# In[169]:


finalduplicates = duplicates[duplicates.duplicated()]
print(finalduplicates)


# In[171]:


finalduplicates = finalduplicates.drop_duplicates()


# In[172]:


finalduplicates.shape


# In[173]:


mergedfiles1 = mergedfiles1.drop_duplicates()


# In[175]:


mergedfiles1.shape


# In[177]:


mergedfiles1.query('Income <= 0')


# In[ ]:




